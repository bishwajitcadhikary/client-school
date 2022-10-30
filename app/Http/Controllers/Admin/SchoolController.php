<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Jobs\ImportSchoolDatabase;
use App\Models\School;
use App\Models\User;
use App\Notifications\SendSchoolCredentials;
use App\Rules\Domain;
use Config;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Throwable;

class SchoolController extends Controller
{
    public function index()
    {
        $schools = School::with('customer')->latest()->paginate(10);

        return Inertia::render('Admin/School/Index', [
            'schools' => $schools
        ]);
    }

    public function create(Request $request)
    {
        $customers = $this->getCustomers($request);

        return Inertia::render('Admin/School/Create', [
            'customers' => $customers,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'customer' => ['required', Rule::exists('users', 'id')->where('status', true)],
            'name' => ['required', 'string'],
            'domain' => ['required', 'unique:schools', new Domain()]
        ]);

        $databaseName = config('wovo.sub_domain_db_prefix') . Str::random();

        $school = School::create([
            'customer_id' => $data['customer'],
            'name' => $data['name'],
            'host' => config('database.connections.school.host'),
            'port' => config('database.connections.school.port'),
            'username' => config('database.connections.school.username'),
            'password' => config('database.connections.school.password'),
            'database' => $databaseName,
            'domain' => str($data['domain'])->remove(['https://', 'http://', 'www.', '/*', ' '])
        ]);

        ImportSchoolDatabase::dispatch($databaseName, $school);

        Session::flash('success', __("School Created Successfully"));

        User::find($data['customer'])->notify(new SendSchoolCredentials($school));

        return to_route('admin.schools.index');
    }

    public function show(School $school)
    {
        return Inertia::render('Admin/School/Show', [
            'school' => $school
        ]);
    }

    public function edit(Request $request, School $school)
    {
        $customers = $this->getCustomers($request);

        return Inertia::render('Admin/School/Edit', [
            'school' => $school,
            'customers' => $customers,
        ]);
    }

    public function update(Request $request, School $school)
    {
        $data = $request->validate([
            'customer' => ['required', Rule::exists('users', 'id')->where('status', true)],
            'name' => ['required', 'string'],
            'domain' => ['required', new Domain(), Rule::unique('schools')->ignore($school->id)],
            'is_active' => ['boolean'],
            'host' => ['required', 'string'],
            'port' => ['required', 'string'],
            'username' => ['required', 'string'],
            'password' => ['required', 'string'],
            'database' => ['required', 'string'],
            'create_new_database' => ['boolean']
        ]);

        $oldDatabase = $school->database;

        try {
            $school->update([
                'customer_id' => $data['customer'],
                'name' => $data['name'],
                'host' => $data['host'],
                'port' => $data['port'],
                'username' => $data['username'],
                'password' => $data['password'],
                'database' => $data['database'],
                'domain' => str($data['domain'])->remove(['https://', 'http://', 'www.', '/*', ' ']),
                'is_active' => $data['is_active'],
            ]);

            if ($data['create_new_database']) {
                try {
                    DB::statement('DROP DATABASE ' . $oldDatabase);
                } catch (Throwable $th) {
                    ImportSchoolDatabase::dispatch($data['database'], $school);
                }
            }

            Session::flash('success', __("School Updated Successfully"));

            return redirect()->route('admin.schools.show', $school->id);
        }catch (Throwable $th){
            Session::flash('error', $th->getMessage());
            return redirect()->back();
        }
    }

    public function destroy(School $school)
    {
        try {
            DB::statement('DROP DATABASE ' . $school->database);

            $school->delete();
        } catch (Throwable $th) {}

        Session::flash('success', __("School Deleted Successfully"));

        return to_route('admin.schools.index');
    }

    public function databaseCreationRetry(School $school)
    {
        Config::set([
            'database.connections.school.host' => $school->host,
            'database.connections.school.port' => $school->port,
            'database.connections.school.username' => $school->username,
            'database.connections.school.password' => $school->password,
            'database.connections.school.database' => $school->database,
        ]);

        try {
            try {
                DB::connection('school')->getPdo();
                Session::flash('error', __("Database already exists"));
            } catch (Throwable $e) {
                ImportSchoolDatabase::dispatch($school->database, $school);

                $school->update([
                    'database_created' => 0
                ]);

                Session::flash('success', __("Database Creating..."));
            }
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeStatus(School $school)
    {
        $school->update([
            'is_active' => $school->is_active = !$school->is_active,
        ]);

        Session::flash('success', __('School has been status updated'));
    }

    public function getCustomers(Request $request)
    {
        $search = $request->header('search');

        return User::where([
            'role' => 'customer',
            'status' => true,
        ])
            ->when(!empty($search), function ($builder) use ($search) {
                $builder->where('name', 'like', "%{$search}%")
                    ->orWhere('username', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%")
                    ->orWhere('phone', 'like', "%{$search}%")
                    ->orWhere('website', 'like', "%{$search}%");
            })
            ->limit(10)
            ->get();
    }
}
