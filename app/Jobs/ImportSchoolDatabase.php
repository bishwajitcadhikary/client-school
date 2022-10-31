<?php

namespace App\Jobs;

use App\Models\School;
use App\Models\User;
use App\Notifications\DatabaseCreated;
use App\Notifications\DatabaseCreateFailed;
use App\Notifications\SendSchoolCredentials;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Notification;
use Throwable;

class ImportSchoolDatabase implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private string $databaseName;
    private School $school;

    public function __construct(string $databaseName, School $school)
    {
        $this->databaseName = $databaseName;
        $this->school = $school;
    }

    public function handle()
    {
        Config::set([
            'database.connections.school.database' => $this->databaseName
        ]);

        DB::statement('CREATE DATABASE '.$this->databaseName);

        DB::connection('school')->unprepared(file_get_contents(storage_path('school.sql')));

        $this->school->update([
            'database_created' => 1
        ]);

        try {
            User::whereRole('admin')->first()->notify(new DatabaseCreated($this->school));
        }catch (Throwable $e){};
    }

    public function failed(Throwable $exception)
    {
        Config::set([
            'database.connections.school.database' => $this->databaseName
        ]);

        DB::statement('DROP DATABASE '.$this->databaseName);

        $this->school->update([
            'database_created' => 2
        ]);

        try {
            User::whereRole('admin')->first()->notify(new DatabaseCreateFailed($this->school,  $exception->getMessage()));
        }catch (Throwable $e){};
    }
}
