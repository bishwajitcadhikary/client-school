<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Gateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use Throwable;

class GatewayController extends Controller
{
    public function index()
    {
        $gateways = Gateway::with('currency')->latest()->paginate(10);

        return Inertia::render('Admin/Settings/Gateway/Index', [
            'gateways' => $gateways,
        ]);
    }

    public function create()
    {
        $currencies = Currency::selectRaw('name as title, id as value, rate, code, symbol')->get();

        return Inertia::render('Admin/Settings/Gateway/Create', [
            'currencies' => $currencies,
        ]);
    }

    public function store(Request $request)
    {
        try {
            $gateway = Gateway::createGateway($request);
            $gateway->addMedia($request->file('logo'))
                ->toMediaCollection('logo');

            Session::flash('success', __('Gateway Created Successfully'));

            return to_route('admin.settings.gateways.index');
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function edit(Gateway $gateway)
    {
        $currencies = Currency::selectRaw('name as title, id as value, rate, code, symbol')->get();
        $gateway->load('currency');
        return Inertia::render('Admin/Settings/Gateway/Edit', [
            'currencies' => $currencies,
            'gateway' => $gateway,
        ]);
    }

    public function update(Request $request, Gateway $gateway)
    {
        try {
            $gateway->updateGateway($request);

            Session::flash('success', __('Gateway Updated Successfully'));

            return to_route('admin.settings.gateways.index');
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function destroy(Gateway $gateway)
    {
        try {
            $gateway->delete();

            Session::flash('success', __('Gateway Deleted Successfully'));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeStatus(Request $request, Gateway $gateway)
    {
        $data = $request->validate([
            'is_active' => ['required', 'boolean'],
        ]);

        try {
            $gateway->update([
                'is_active' => $data['is_active'],
            ]);

            Session::flash('success', __('Gateway Status Changed Successfully'));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }
}
