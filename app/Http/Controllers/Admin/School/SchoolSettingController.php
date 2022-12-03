<?php

namespace App\Http\Controllers\Admin\School;

use App\Http\Controllers\Controller;
use App\Models\School;
use Illuminate\Http\Request;
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

        return Inertia::render('Admin/School/Settings/Index', [
            'school' => $school,
            'setting' => $setting,
        ]);
    }

    public function update(Request $request, School $school)
    {
        $holidays = [];
        foreach ($request->holidays as $holiday) {
            $holidays[] = \Date::parse($holiday)->format('Y-m-d');
        }
        $request->merge(['holidays' => $holidays]);

        $data = $request->validate([
            'attendance_update_at' => ['required', 'date_format:H:i'],
            'late_time' => ['required', 'date_format:H:i'],
            'absent_time' => ['required', 'date_format:H:i'],
            'weekends' => ['nullable', 'array'],
            'weekends.*' => ['nullable', 'string', 'in:sunday,monday,tuesday,wednesday,thursday,friday,saturday'],
            'holidays' => ['required', 'array'],
            'holidays.*' => ['required', 'date_format:Y-m-d'],
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
