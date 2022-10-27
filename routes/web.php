<?php

use App\Jobs\ImportSchoolDatabase;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome');
});

Route::get('test', function () {
    return \App\Models\School::whereDomain($_SERVER['HTTP_HOST'])->get();
});

Route::get('install', function () {
    Artisan::call('migrate:fresh');
    Artisan::call('db:seed');
});

require __DIR__.'/admin.php';
require __DIR__.'/auth.php';
