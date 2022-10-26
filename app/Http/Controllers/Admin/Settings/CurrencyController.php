<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Setting;
use App\Space\Wovo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use Throwable;

class CurrencyController extends Controller
{
    public function index()
    {
        $last_sync_at = Setting::getSetting('currency_last_sync_at');
        $currencies = Currency::latest()->paginate(10);
        return Inertia::render('Admin/Settings/Currency/Index', [
            'currencies' => $currencies,
            'last_sync_at' => Wovo::formatDate($last_sync_at, 'd M, Y h:i A')
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Settings/Currency/Create');
    }

    public function store(Request $request)
    {
        Currency::createCurrency($request);

        Session::flash('success', __("Currency Created Successfully"));

        return to_route('admin.settings.currencies.index');
    }

    public function show(Currency $currency)
    {
        //
    }

    public function edit(Currency $currency)
    {
        return Inertia::render('Admin/Settings/Currency/Edit', [
            'currency' => $currency
        ]);
    }

    public function update(Request $request, Currency $currency)
    {
        $currency->updateCurrency($request);

        Session::flash('success', __("Currency Updated Successfully"));

        return to_route('admin.settings.currencies.index');
    }

    public function destroy(Currency $currency)
    {
        $currency->delete();

        Session::flash('success', __('Currency Deleted Successfully'));
    }

    public function changeStatus(Request $request, Currency $currency)
    {
        $data = $request->validate([
            'is_active' => ['required', 'boolean']
        ]);

        try {
            $currency->update([
                'is_active' => $data['is_active']
            ]);

            Session::flash('success', __("Currency Status Changed Successfully"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeDefault(Request $request, Currency $currency)
    {
        $request->validate([
            'is_default' => ['required', 'boolean']
        ]);

        try {
            Currency::updateDefaults();
            $currency->update([
                'is_default' => true,
                'rate' => 1
            ]);

            Currency::sync();

            Session::flash('success', __("Currency set as default"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function sync()
    {
        Currency::sync();
    }
}
