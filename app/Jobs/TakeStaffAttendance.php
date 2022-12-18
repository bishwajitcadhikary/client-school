<?php

namespace App\Jobs;

use App\Models\FPDevice;
use App\Models\Sass\Staff;
use App\Models\School;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class TakeStaffAttendance implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public School $school;
    public mixed $setting;

    public function __construct(School $school, $setting)
    {
        $this->school = $school;
        $this->setting = $setting;
    }
    public function handle()
    {
        $devices = FPDevice::whereIsActive(true)
            ->whereSchoolId($this->school->id)
            ->get();

        dd($devices);
    }
}
