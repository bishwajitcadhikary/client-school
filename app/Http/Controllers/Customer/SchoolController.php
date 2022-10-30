<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Jobs\ImportSchoolDatabase;
use App\Models\School;
use App\Models\User;
use App\Notifications\NewSchoolAdded;
use App\Notifications\SendSchoolCredentials;
use App\Rules\Domain;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Notification;
use Throwable;

class SchoolController extends Controller
{
    private function checkSchoolLimit(){
        $schoolLimit = Auth::user()->plan->school_limit;
        $schoolCount = Auth::user()->schools()->count();

        if($schoolLimit <= $schoolCount){
            return false;
        }

        return true;
    }

    public function index()
    {
        $schools = School::whereCustomerId(Auth::id())->latest()->paginate(10);

        return Inertia::render('Customer/School/Index', [
            'schools' => $schools
        ]);
    }

    public function create()
    {
        return Inertia::render('Customer/School/Create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'domain' => ['required', 'unique:schools', new Domain()]
        ]);

        DB::beginTransaction();
        try {
            $databaseName = config('wovo.sub_domain_db_prefix') . Str::random();

            $school = School::create([
                'customer_id' => Auth::id(),
                'name' => $data['name'],
                'host' => config('database.connections.school.host'),
                'port' => config('database.connections.school.port'),
                'username' => config('database.connections.school.username'),
                'password' => config('database.connections.school.password'),
                'database' => $databaseName,
                'domain' => str($data['domain'])->remove(['https://', 'http://', 'www.', '/*', ' ']),
                'is_active' => true
            ]);

            DB::commit();

            ImportSchoolDatabase::dispatch($databaseName, $school);

            User::whereRole('admin')->firstOrFail()->notify(new NewSchoolAdded($school));
            Auth::user()->notify(new SendSchoolCredentials($school));

            Session::flash('success', __("School Created Successfully"));

            return to_route('customer.schools.index');
        }catch (Throwable $e){
            DB::rollBack();

            Session::flash('error', __("Something went wrong"));

            return to_route('customer.schools.index');
        }
    }

    public function edit(Request $request, School $school)
    {
        abort_if($school->customer_id !== Auth::id(), 403);
        return Inertia::render('Customer/School/Edit', [
            'school' => $school
        ]);
    }

    public function update(Request $request, School $school)
    {
        abort_if($school->customer_id !== Auth::id(), 403);
        $request->validate([
            'name' => ['required', 'string'],
            'domain' => ['required', new Domain(), Rule::unique('schools')->ignore($school->id)],
            'is_active' => ['boolean'],
        ]);

        $school->update($request->only(['name', 'domain', 'is_active']));

        Session::flash('success', __("School Updated Successfully"));

        return redirect()->route('customer.schools.index');
    }

    public function destroy(School $school)
    {
        abort_if($school->customer_id !== Auth::id(), 403);
        try {
            if ($school->database_created) {
                DB::statement('DROP DATABASE ' . $school->database);
            }

            $school->delete();

            Session::flash('success', __("School Deleted Successfully"));

            return to_route('customer.schools.index');
        } catch (Throwable $th) {
            Session::flash('success', $th->getMessage());

            return to_route('customer.schools.index');
        }
    }
}
