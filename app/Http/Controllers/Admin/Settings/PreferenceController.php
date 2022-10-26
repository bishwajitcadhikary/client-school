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
use Session;

class PreferenceController extends Controller
{
    public function index()
    {
        $currencies = Currency::selectRaw('id as value, name as title, id')->orderBy('name')->get();
        $languages = Language::whereIsActive(true)->selectRaw('code as value, name as title')->get();
        $dateFormatters = DateFormatter::get_list();
        $timeZones = TimeZone::get_list();
        $financialYears = collect(config('wovo.financial_years'))->map(fn ($i) => ['title' => $i['key'], 'value' => $i['value']]);

        $settings = Setting::whereIn('option', [
            'financial_year',
            'time_zone',
            'date_format',
            'language',
            'currency',
        ])
            ->pluck('value', 'option');

        return Inertia::render('Admin/Settings/Preference/Index', [
            'currencies' => $currencies,
            'languages' => $languages,
            'dateFormatters' => $dateFormatters,
            'timeZones' => $timeZones,
            'financialYears' => $financialYears,
            'settings' => $settings,
        ]);
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'currency' => ['required', 'exists:currencies,id'],
            'language' => ['required', 'string'],
            'date_format' => ['required', 'string'],
            'time_zone' => ['required', 'string'],
            'financial_year' => ['required', 'string'],
        ]);

        Setting::setSettings($validated);

        Session::flash('success', __('Preferences Updated Successfully'));

        return redirect()->back();
    }
}
