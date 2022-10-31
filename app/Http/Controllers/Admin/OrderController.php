<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PlanOrder;
use App\Notifications\SendOrderStatusUpdated;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class OrderController extends Controller
{
    public function index()
    {
        $orders = PlanOrder::with(['customer', 'plan', 'gateway'])->latest()->paginate(10);

        return Inertia::render('Admin/Order/Index', [
            'orders' => $orders,
        ]);
    }

    public function accept(PlanOrder $order)
    {
        if ($order->status == 0) {
            $order->update([
                'status' => 1,
            ]);

            if ($order->customer->plan_id != $order->plan_id) {
               $order->customer->update([
                    'plan_id' => $order->plan_id,
                    'plan_expire_at' => $order->interval === 'monthly' ? now()->addMonth() : now()->addYear(),
                ]);
            } else {
                $extraDays = Carbon::parse($order->customer->plan_expire_at)->diffInDays(now());
                $order->customer->update([
                    'plan_expire_at' => $order->customer->plan_expire_at < now() ?
                        ($order->interval === 'monthly' ? now()->addMonth() : now()->addYear()) :
                        ($order->interval === 'monthly' ? now()->addMonth()->addDays($extraDays) : now()->addYear()->addDays($extraDays)),
                ]);
            }

            Session::flash('success', 'Order accepted successfully');

            $order->customer->notify(new SendOrderStatusUpdated($order));

            return redirect()->back();
        } elseif ($order->status == 2){
            Session::flash('error', 'Order already rejected');
            return redirect()->back();
        } else {
            Session::flash('error', 'Order already accepted');
            return redirect()->back();
        }
    }

    public function reject(PlanOrder $order)
    {
        if ($order->status == 0) {
            $order->update([
                'status' => 2,
            ]);

            Session::flash('success', 'Order rejected successfully');
            return redirect()->back();
        } elseif ($order->status == 1){
            Session::flash('error', 'Order already accepted');
            return redirect()->back();
        } else {
            Session::flash('error', 'Order already rejected');
            return redirect()->back();
        }
    }
}
