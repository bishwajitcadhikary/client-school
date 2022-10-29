<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Gateway;
use App\Models\Plan;
use App\Models\PlanOrder;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Session;

class SubscriptionController extends Controller
{
    public function index()
    {
        $plans = Plan::whereIsActive(true)->get();

        return Inertia::render('Customer/Subscription/Index', [
            'plans' => $plans
        ]);
    }

    public function payment(Request $request, Plan $plan)
    {
        $interval = $request->header('X-Interval');

        $gateways = Gateway::whereIsActive(true)->get();

        return Inertia::render('Customer/Subscription/Payment', [
            'plan' => $plan,
            'interval' => $interval,
            'gateways' => $gateways
        ]);
    }

    public function paymentStore(Request $request, Plan $plan)
    {
        $data = $request->validate([
            'gateway' => ['required', 'exists:gateways,id'],
            'trx_id' => ['required', 'string'],
            'screenshot' => ['required', 'image', 'max:1024'],
            'interval' => ['required', 'in:monthly,yearly'],
            'description' => ['required', 'string'],
        ]);

        $data['gateway_id'] = $data['gateway'];
        unset($data['gateway']);

        PlanOrder::create($data);

        Session::flash('success', 'Your order has been placed successfully. We will review your order and get back to you soon.');

        return redirect()->route('customer.subscription.index');
    }
}
