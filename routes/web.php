<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use Inertia\Inertia;
Route::get('/', function () {
    return Inertia::render('Welcome');
});

Route::get('test', function (){
    return \App\Models\Setting::getSetting('date_format');
});

Route::get('install', function () {
    Artisan::call('migrate:fresh');
    Artisan::call('db:seed');
});

require __DIR__.'/admin.php';
require __DIR__.'/auth.php';
