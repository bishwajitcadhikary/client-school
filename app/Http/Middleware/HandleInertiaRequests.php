<?php

namespace App\Http\Middleware;

use App\Models\Currency;
use App\Models\Setting;
use Illuminate\Http\Request;
use Inertia\Middleware;
use Tightenco\Ziggy\Ziggy;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    public function version(Request $request)
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return mixed[]
     */
    public function share(Request $request)
    {
        $planExpired = auth()->check() ? auth()->user()->plan_expire_at <= now() : true;
        return array_merge(parent::share($request), [
            'auth' => [
                'user' => $request->user(),
                'plan_expired' => $planExpired,
            ],
            'ziggy' => function () use ($request) {
                return array_merge((new Ziggy)->toArray(), [
                    'location' => $request->url(),
                ]);
            },
            'app' => [
                'name' => config('app.name'),
                'url' => config('app.url'),
                'date_format' => Setting::getSetting('date_format') ?? 'DD DDD, YYYY',
                'currency' => Currency::whereIsDefault(true)->selectRaw('name, code, rate, id, symbol')->first(),
            ],
            'flash' => [
                'success' => fn () => $request->session()->get('success'),
                'error' => fn () => $request->session()->get('error'),
                'warning' => fn () => $request->session()->get('warning'),
                'info' => fn () => $request->session()->get('info'),
            ],
        ]);
    }
}
