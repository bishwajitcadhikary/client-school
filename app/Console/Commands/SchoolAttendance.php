<?php

namespace App\Console\Commands;

use App\Jobs\TakeAttendance;
use App\Jobs\TakeStaffAttendance;
use App\Jobs\TakeStudentAttendance;
use App\Models\School;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;

class SchoolAttendance extends Command
{
    protected $signature = 'school:attendance';

    protected $description = 'This command will take attendance of all students of all schools';

    public function handle()
    {
        // Get all schools from database who has attendance enabled
        $schools = School::whereHas('devices', function (Builder $builder) {
            $builder->where('is_active', true);
        })->get();

        // Loop through all schools and take attendance
        foreach ($schools as $school) {
            $setting = $this->getSchoolSettings($school);

            $this->takeStudentAttendance($school, $setting);
            $this->takeStaffAttendance($school, $setting);
        }
    }

    public function takeStudentAttendance($school, $setting)
    {
        // Convert update time to seconds
        $attendanceUpdateAt = strtotime($setting['attendance_update_at']);

        // Calculate left time from now to attendance update time
        $leftTime = $attendanceUpdateAt - time();

        TakeStudentAttendance::dispatchSync($school, $setting);//->delay($leftTime);
    }

    public function takeStaffAttendance($school, $setting)
    {
        // Convert update time to seconds
        $attendanceUpdateAt = strtotime($setting['staff_attendance_update_at']);

        // Calculate left time from now to attendance update time
        $leftTime = $attendanceUpdateAt - time();

        TakeStaffAttendance::dispatchSync($school, $setting);//->delay($leftTime);
    }

    private function getSchoolSettings(School $school): array
    {
        // Check if school does not have settings then return default settings
        if (!$school->settings) {
            $school->settings()->createMany([
                'school_year' => 1,
                'attendance_update_at' => '16:00:00',
                'late_time' => '12:00:00',
                'absent_time' => '14:00:00',
                'weekends' => [],
                'holidays' => [],

                'staff_attendance_update_at' => '16:00:00',
                'staff_late_time' => '12:00:00',
                'staff_absent_time' => '14:00:00',
                'staff_weekends' => [],
                'staff_holidays' => [],
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
