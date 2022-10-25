<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome');
});

Route::get('test', function (){
    return \App\Models\Setting::getSetting('date_format');
});

require __DIR__.'/admin.php';
require __DIR__.'/auth.php';
