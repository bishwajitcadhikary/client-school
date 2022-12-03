<?php

namespace App\Console\Commands;

use App\Jobs\TakeAttendance;
use App\Models\FPDevice;
use App\Models\Sass\Enroll;
use App\Models\Sass\StudentAttendance;
use App\Models\School;
use App\Space\StellarBD;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Date;

class SchoolAttendance extends Command
{
    protected $signature = 'school:attendance';

    protected $description = 'This command will take attendance of all students of all schools';

    public function handle()
    {
        // Get all schools from database who has attendance enabled

        $schools = School::whereHas('devices', function (Builder $builder){
            $builder->where('is_active', true);
        })->get();

        // Loop through all schools and take attendance

        foreach ($schools as $school){
            $setting = $this->getSchoolSettings($school);

            $time = strtotime($setting['attendance_update_at']);

            // Calculate delay time and dispatch job
            $delay = $time - time();
            TakeAttendance::dispatch($school, $setting)->delay($delay);
        }
    }

    private function getSchoolSettings(School $school): array
    {
        // Check if school does not have settings then return default settings
        if (!$school->settings) {
            $school->settings()->createMany([
                'attendance_update_at' => '16:00:00',
                'late_time' => '12:00:00',
                'absent_time' => '14:00:00',
                'weekends' => [],
                'holidays' => [],
            ]);
        }

        // Get setting as key value pair
        $setting = $school->setting->pluck('value', 'option')->toArray();
        // if value is json, decode it
        foreach ($setting as $key => $value) {
            if ($this->isJson($value)) {
                $setting[$key] = json_decode($value);
            }
        }
        return $setting;
    }

    private function isJson($string): bool
    {
        json_decode($string);
        return json_last_error() === JSON_ERROR_NONE;
    }
}
