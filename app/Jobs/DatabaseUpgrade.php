<?php

namespace App\Jobs;

use App\Models\School;
use App\Models\User;
use DB;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Config;
use Storage;

class DatabaseUpgrade implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct(public \App\Models\DatabaseUpgrade $databaseUpgrade)
    {
    }


    public function handle()
    {
        $schools = School::all();

        $path = 'database/'.$this->databaseUpgrade->database;
        if (Storage::exists($path)) {
            $sql = Storage::get($path);

            $failed = [];
            $success = [];
            foreach ($schools as $school) {
                try {
                    Config::set([
                        'database.connections.school.database' => $school->database,
                        'database.connections.school.username' => $school->username,
                        'database.connections.school.password' => $school->password,
                        'database.connections.school.host' => $school->host,
                        'database.connections.school.port' => $school->port,
                    ]);
                    DB::connection('school')->unprepared($sql);

                    DB::connection('school')->disconnect();

                    $success[] = [
                        'id' => $school->id,
                        'name' => $school->name,
                        'domain' => $school->domain,
                        'database' => $school->database,
                    ];
                }catch (\Exception $exception) {
                    $failed[] = [
                        'id' => $school->id,
                        'name' => $school->name,
                        'domain' => $school->name,
                        'error' => str($exception->getMessage())->remove('\n'),
                    ];
                }
            }

            $this->databaseUpgrade->update([
                'status' => 'success',
                'success' => $success,
                'failed' => $failed,
            ]);

            User::whereRole('admin')->first()->notify(new \App\Notifications\DatabaseUpgrade($this->databaseUpgrade, $success, $failed));
        }else{
            $this->databaseUpgrade->update([
                'status' => 'failed',
            ]);

            User::whereRole('admin')->first()->notify(new \App\Notifications\NewNotification('Database upgrade failed.', route('admin.database-upgrades.index')));
        }
    }
}
