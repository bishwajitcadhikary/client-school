<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Jobs\ImportSchoolDatabase;
use App\Models\School;
use App\Rules\AlphaDot;
use App\Rules\Domain;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Inertia\Inertia;

class SchoolController extends Controller
{
    public function index()
    {
        $schools = School::with('customer')->latest()->paginate(10);

        return Inertia::render('Admin/School/Index', [
            'schools' => $schools
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/School/Create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'domain' => ['required', 'unique:schools', new Domain()]
        ]);

        $databaseName = Str::random();

        $school = School::create([
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

        return to_route('admin.schools.index');
    }

    public function show(School $school)
    {
        //
    }

    public function edit(School $school)
    {
        //
    }

    public function update(Request $request, School $school)
    {
        //
    }

    public function destroy(School $school)
    {
        //
    }

    public function databaseCreationRetry(School $school)
    {
        \Config::set([
            'database.connections.school.host' => $school->host,
            'database.connections.school.port' => $school->port,
            'database.connections.school.username' => $school->username,
            'database.connections.school.password' => $school->password,
            'database.connections.school.database' => $school->database,
        ]);

        try {
            try {
                DB::connection('school')->getPdo();
            }catch (\Throwable $e){
                ImportSchoolDatabase::dispatch($school->database, $school);

                $school->update([
                    'database_created' => 0
                ]);

                Session::flash('success', __("Database Creating..."));
            }
        }catch (\Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }
}
