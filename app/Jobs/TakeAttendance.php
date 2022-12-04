<?php

namespace App\Jobs;

use App\Mail\AttendanceTakenMail;
use App\Models\FPDevice;
use App\Models\Sass\Enroll;
use App\Models\Sass\StudentAttendance;
use App\Models\School;
use App\Space\StellarBD;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Date;

class TakeAttendance implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected School $school;
    protected array $setting;

    public function __construct(School $school, $setting)
    {
        $this->school = $school;
        $this->setting = $setting;
    }

    public function handle()
    {
        try {
            $this->changeDatabaseConnection($this->school);

            // Take attendance
            $this->takeAttendance($this->school);
        }catch (\Exception $exception){
            // Log error
            logger($exception->getMessage());
        }
    }

    private function changeDatabaseConnection(School $school)
    {
        config([
            'database.connections.school.database' => $school->database,
            'database.connections.school.username' => $school->username,
            'database.connections.school.password' => $school->password,
            'database.connections.school.host' => $school->host,
            'database.connections.school.port' => $school->port,
        ]);
    }

    private function takeAttendance(School $school)
    {
        // Get all devices of school
        $devices = $school->devices;

        // Loop through all devices and take attendance
        foreach ($devices as $device){
            // Take attendance
            $this->takeAttendanceFromDevice($device);
        }
    }

    private function takeAttendanceFromDevice(FPDevice $device)
    {
        // Get Log from StellarBD
        $stellarBD = new StellarBD($device->auth_code, $device->auth_user);
        $log = $stellarBD->getLog();

        // Get student attendants
        $today = today()->format('Y-m-d');
        $attendants = Enroll::attendants($today)->get();

        // Loop through all attendants and store attendance
        $students = [];
        foreach ($attendants as $index => $attendant) {
            $logs = array_filter($log['data'] ?? [], function ($item) use ($attendant) {
                return $item['user_name'] == $attendant->register_no;
            });
            // Get First log of student
            $firstLog = collect($logs)->sortBy('access_time')->first();

            StudentAttendance::updateOrCreate([
                'student_id' => $attendant->student_id,
                'date' => $today,
            ], [
                'status' => $this->getStatus($firstLog),
                'branch_id' => $attendant->branch_id,
            ]);

            $students[] = [
                'student_id' => $attendant->student_id,
                'date' => $today,
                'status' => $this->getStatus($firstLog),
            ];
        }

       /* // Send email
        if (isset($this->setting['email']) && count($students) > 0){
            \Mail::to($this->setting['email'])->send(new AttendanceTakenMail($students));
        }*/
    }

    private function getStatus($log): string
    {
        $lateTime = Date::parse($this->setting['late_time'] ?? null)->format('H:i:s');
        $absentTime = Date::parse($this->setting['absent_time'] ?? null)->format('H:i:s');
        $accessTime = Date::parse($log['access_time'] ?? null)->format('H:i:s');

        // Check Holiday & Weekend
        if ($this->isHoliday() || $this->isWeekend()) {
            return 'H';
        }

        // Check if log is Absent
        if (empty($log) || $accessTime > $absentTime) {
            return "A";
        }

        // Check if late
        if ($accessTime > $lateTime) {
            return "L";
        }

        return "P";
    }

    private function isHoliday(): bool
    {
        return in_array(today()->format('Y-m-d'), $this->setting['holidays']);
    }

    private function isWeekend(): bool
    {
        // make weekends first letter uppercase
        $weekends = array_map(function ($item) {
            return ucfirst($item);
        }, $this->setting['weekends']);

        return in_array(today()->format('l'), $weekends);
    }
}
