<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Session;

class AdminMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (auth()->user()->isAdmin()) {
            return $next($request);
        }

        Session::flash('error', __("You don't have permission to access this page."));

        return redirect()->route('customer.dashboard.index');
    }
}
