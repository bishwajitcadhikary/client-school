<?php

namespace App\Http\Middleware;

use App;
use App\Models\Setting;
use Auth;
use Closure;
use Illuminate\Http\Request;

class LocalizationMiddleware
{
    public function handle(Request $request, Closure $next)
    {

        if (Auth::check() && Auth::user()->language){
            App::setLocale(Auth::user()->language->code);
        }elseif (Setting::getSetting('language')) {
            App::setLocale(Setting::getSetting('language'));
        }

        return $next($request);
    }
}
