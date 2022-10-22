<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Language;
use App\Models\Setting;
use App\Space\DateFormatter;
use App\Space\TimeZone;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PreferenceController extends Controller
{
    public function index()
    {
        $currencies = Currency::selectRaw('id as value, name as title')->latest()->get();
        $languages = Language::whereIsActive(true)->selectRaw('code as value, name as title')->get();
        $dateFormatters =  DateFormatter::get_list();
        $timeZones = TimeZone::get_list();
        $financialYears = collect(config('wovo.financial_years'))->map(fn($i) => ['title' => $i['key'], 'value' => $i['value']]);

        return Inertia::render('Admin/Settings/Preference/Index', [
            'currencies' => $currencies,
            'languages' => $languages,
            'dateFormatters' => $dateFormatters,
            'timeZones' => $timeZones,
            'financialYears' => $financialYears,
        ]);
    }

    public function update(Request $request)
    {
       $validated = $request->validate([
            'currency' => ['required', 'string'],
            'language' => ['required', 'string'],
            'date_format' => ['required', 'string'],
            'time_zone' => ['required', 'string'],
            'financial_year' => ['required', 'string'],
        ]);

       dd($validated);
        Setting::setSettings($validated);

        \Session::flash('success', __("Preferences Updated Successfully"));

        return redirect()->back();
    }
}
