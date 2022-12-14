<?php

namespace App\Providers;

use App\Space\Wovo;
use Illuminate\Support\ServiceProvider;

class WovoServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->bind('wovo', function () {
            return new Wovo();
        });
    }
}
