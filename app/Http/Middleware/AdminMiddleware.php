<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Session;

class AdminMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (auth()->check() && auth()->user()->role == 'admin') {
            return $next($request);
        }

        Session::flash('error', __("You don't have permission to access this page."));

        return redirect()->route('login');
    }
}
