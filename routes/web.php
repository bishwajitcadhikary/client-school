<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use Inertia\Inertia;
use Symfony\Component\Process\Process;

Route::get('/', function () {
    return Inertia::render('Welcome');
});

Route::get('test', function (){
    return \App\Models\Setting::getSetting('date_format');
});

Route::get('install', function () {
    Artisan::call('migrate:fresh');
    Artisan::call('db:seed');

    $process = new Process(['yarn build']);

    $process->run();
});

require __DIR__.'/admin.php';
require __DIR__.'/auth.php';
