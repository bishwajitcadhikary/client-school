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
use Illuminate\Support\Facades\Config;
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
        $schools = School::whereCustomerId(Auth::id())
            ->select(['id', 'name', 'domain', 'created_at', 'is_active', 'database_created'])
            ->latest()
            ->paginate(10);

        return Inertia::render('Customer/School/Index', [
            'schools' => $schools
        ]);
    }

    public function create()
    {
        if (!$this->checkSchoolLimit()) {
            Session::flash('error', 'You have reached your school limit. Please upgrade your plan to add more schools.');
            return to_route('customer.schools.index');
        }

        return Inertia::render('Customer/School/Create');
    }

    public function store(Request $request)
    {
        if (!$this->checkSchoolLimit()) {
            Session::flash('error', 'You have reached your school limit. Please upgrade your plan to add more schools.');
            return to_route('customer.schools.index');
        }
        $data = $request->validate([
            'name' => ['required', 'string'],
        ]);

        $domain = str($data['name'])->lower()->explode(' ')->map(function ($item){
            return substr($item, 0, 1);
        })->implode('');

        if (School::whereDomain($domain)->exists()) {
            $domain = $domain . '_' . Str::random(5);
        }
        $domain = $domain . '.'. config('wovo.main_domain');

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
                'domain' => $domain,
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
        abort_if(!$school->customer_id === Auth::id(), 403);
        $school->only(['id', 'name', 'domain', 'is_active', 'created_at']);
        return Inertia::render('Customer/School/Edit', [
            'school' => $school
        ]);
    }

    public function update(Request $request, School $school)
    {
        abort_if(!$school->customer_id === Auth::id(), 403);
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
        abort_if(!$school->customer_id === Auth::id(), 403);
        try {
            if ($school->database_created) {
                Config::set([
                    'database.connections.school.database' => $school->database,
                ]);

                DB::connection('school')->statement('DROP DATABASE ' . $school->database);

                DB::connection('school')->disconnect();
            }

            $school->delete();
            Session::flash('success', __("School Deleted Successfully"));

            return to_route('customer.schools.index');
        } catch (Throwable $th) {
            Session::flash('error', 'School could not be deleted');

            return to_route('customer.schools.index');
        }
    }
}
