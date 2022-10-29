<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class SubscriptionMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (!$request->user()->plan) {
            Session::flash('error', 'You need to subscribe to a plan.');
            return to_route('customer.subscription.index');
        }

        if ($request->user()->plan_expire_at <= now()) {
            Session::flash('error', 'Your subscription has expired.');
            return to_route('customer.subscription.index');
        }

        return $next($request);
    }
}
