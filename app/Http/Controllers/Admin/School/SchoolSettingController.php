<?php

namespace App\Http\Controllers\Admin\School;

use App\Http\Controllers\Controller;
use App\Models\Sass\SchoolYear;
use App\Models\School;
use App\Space\Wovo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class SchoolSettingController extends Controller
{
    public function index(School $school)
    {
        // Get setting as key value pair
        $setting = $school->setting->pluck('value', 'option')->toArray();
        // if value is json, decode it
        foreach ($setting as $key => $value) {
            if ($this->isJson($value)) {
                $setting[$key] = json_decode($value);
            }
        }


        Wovo::setDatabaseConnection($school);

        $schoolYears = SchoolYear::on('school')->get()->map(function ($year){
            return [
                'value' => $year->id,
                'title' => $year->school_year,
            ];
        });

        return Inertia::render('Admin/School/Settings/Index', [
            'school' => $school,
            'setting' => $setting,
            'schoolYears' => $schoolYears,
        ]);
    }

    public function update(Request $request, School $school)
    {
        $holidays = [];
        foreach ($request->holidays ?? [] as $holiday) {
            $holidays[] = Date::parse($holiday)->format('Y-m-d');
        }
        $request->merge(['holidays' => $holidays]);

        $staff_holidays = [];
        foreach ($request->staff_holidays ?? [] as $holiday) {
            $staff_holidays[] = Date::parse($holiday)->format('Y-m-d');
        }
        $request->merge(['staff_holidays' => $staff_holidays]);

        $data = $request->validate([
            'school_year' => ['required', 'integer'],
            'attendance_update_at' => ['required', 'date_format:H:i'],
            'late_time' => ['required', 'date_format:H:i'],
            'absent_time' => ['required', 'date_format:H:i'],
            'weekends' => ['nullable', 'array'],
            'weekends.*' => ['nullable', 'string', 'in:sunday,monday,tuesday,wednesday,thursday,friday,saturday'],
            'holidays' => ['nullable', 'array'],
            'holidays.*' => ['nullable', 'date_format:Y-m-d'],

            'staff_attendance_update_at' => ['required', 'date_format:H:i'],
            'staff_late_time' => ['required', 'date_format:H:i'],
            'staff_absent_time' => ['required', 'date_format:H:i'],
            'staff_weekends' => ['nullable', 'array'],
            'staff_weekends.*' => ['nullable', 'string', 'in:sunday,monday,tuesday,wednesday,thursday,friday,saturday'],
            'staff_holidays' => ['nullable', 'array'],
            'staff_holidays.*' => ['nullable', 'date_format:Y-m-d'],
        ]);

        foreach ($data as $index => $datum) {
            $school->setting()->updateOrCreate(
                ['option' => $index],
                ['value' => is_array($datum) ? json_encode($datum) : $datum]
            );
        }

        Session::flash('success', 'School settings updated successfully.');
    }

    private function isJson(mixed $value)
    {
        json_decode($value);
        return json_last_error() === JSON_ERROR_NONE;
    }
}
