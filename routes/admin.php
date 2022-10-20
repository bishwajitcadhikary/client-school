<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\Settings;

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth', 'verified']], function (){
    Route::get('dashboard', fn() => Inertia::render('Admin/Dashboard/Index'))->name('dashboard.index');

    Route::group(['prefix' => 'settings', 'as' => 'settings.'], function (){
        Route::get('roles/assign-permissions/{role}', [Settings\RoleController::class, 'assignPermission'])->name('roles.assign-permission');
        Route::put('roles/assign-permissions/{role}/update', [Settings\RoleController::class, 'assignPermissionUpdate'])->name('roles.assign-permission-update');
        Route::resource('roles', Settings\RoleController::class);
        Route::get('permissions', [Settings\PermissionController::class, 'index'])->name('permissions.index');
    });
});
