<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DatabaseUpgrade;
use App\Models\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rules\File;
use Inertia\Inertia;
use Throwable;

class DatabaseUpgradeController extends Controller
{
    public function index()
    {
        $upgrades = DatabaseUpgrade::latest()->paginate(10);
        return Inertia::render('Admin/DatabaseUpgrade/Index',[
            'upgrades' => $upgrades
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/DatabaseUpgrade/Create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'version' => ['required'],
            'database' => ['required', 'file'],
            'change_log' => ['required'],
        ]);

        $database = $request->file('database');

        if ($database->clientExtension() != 'sql') {
            return back()->with('errors', [
                'database' => 'The database must be a file of type: sql.'
            ]);
        }

        $database->storeAs('database', $database->getClientOriginalName());

        $databaseUpgrade = DatabaseUpgrade::create([
            'version' => $request->version,
            'database' => $database->getClientOriginalName(),
            'change_log' => $request->change_log,
            'status' => 'running',
        ]);

        \App\Jobs\DatabaseUpgrade::dispatch($databaseUpgrade);

        \Session::flash('success', __('Database upgrade is running.'));

        return redirect()->route('admin.database-upgrades.index');
    }

    public function show(DatabaseUpgrade $databaseUpgrade)
    {
        return Inertia::render('Admin/DatabaseUpgrade/Show', [
            'upgrade' => $databaseUpgrade
        ]);
    }

    public function destroy(DatabaseUpgrade $databaseUpgrade)
    {
        if (\Storage::exists('database/' . $databaseUpgrade->database)) {
            \Storage::delete('database/' . $databaseUpgrade->database);
        }

        $databaseUpgrade->delete();

        \Session::flash('success', __('Database upgrade deleted successfully.'));

        return redirect()->route('admin.database-upgrades.index');
    }

    public function downloadBackup()
    {
        try {
            $databases = School::pluck('database');
            $databases = collect($databases)->implode(' ');


            $host = config('database.connections.school.host');
            $port = config('database.connections.school.port');
            $username = config('database.connections.school.username');
            $password = config('database.connections.school.password');

            $database = 'schools' .now()->format('_d_m_y_h_i_s'). '.sql';
            $command = "mysqldump --user={$username} --password={$password} --host={$host} --port={$port} --databases {$databases} > " . storage_path("app/backup/{$database}");

            exec($command);

            return response()->download(storage_path("app/backup/{$database}"));
        }catch (Throwable $th){
            Session::flash('error', $th->getMessage());
            return route('admin.database-upgrades.index');
        }
    }
}
