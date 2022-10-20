<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\Settings;

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth', 'verified']], function (){
    Route::get('dashboard', fn() => Inertia::render('Admin/Dashboard/Index'))->name('dashboard.index');

    Route::group(['prefix' => 'settings', 'as' => 'settings.'], function (){
        Route::resource('roles', Settings\RoleController::class);
    });
});
