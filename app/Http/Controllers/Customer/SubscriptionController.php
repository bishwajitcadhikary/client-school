<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Gateway;
use App\Models\Plan;
use App\Models\PlanOrder;
use App\Models\User;
use App\Notifications\NewSchoolAdded;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

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

        DB::beginTransaction();
        try {
            $planOrder = PlanOrder::create([
                'plan_id' => $plan->id,
                'customer_id' => auth()->id(),
                'interval' => $data['interval'],
                'gateway_id' => $data['gateway'],
                'amount' => $data['interval'] == 'monthly' ? $plan->monthly_price : $plan->yearly_price,
                'trx_id' => $data['trx_id'],
                'description' => $data['description'],
            ]);

            if ($request->hasFile('screenshot')) {
                $planOrder->addMediaFromRequest('screenshot')->toMediaCollection('screenshot');
            }

            Session::flash('success', 'Your order has been placed successfully. We will review your order and get back to you soon.');

            DB::commit();

            User::whereRole('admin')->first()->notify(new NewSchoolAdded($planOrder));

            return redirect()->route('customer.subscription.index');
        } catch (\Throwable $exception) {
            DB::rollBack();
            Session::flash('error', 'Something went wrong. Please try again later.');
            return redirect()->back();
        }
    }
}
