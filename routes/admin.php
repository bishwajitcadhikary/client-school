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

        Route::resource('file-disks', Settings\FileDiskController::class);
        Route::get('backup/download', [Settings\BackupController::class, 'download'])->name('backups.download');
        Route::resource('backups', Settings\BackupController::class)->except('show', 'edit', 'update');
        Route::get('mail', [Settings\MailController::class, 'index'])->name('mail.index');
        Route::put('mail/update', [Settings\MailController::class, 'update'])->name('mail.update');
        Route::get('preferences', [Settings\PreferenceController::class, 'index'])->name('preferences.index');
        Route::put('preferences/update', [Settings\PreferenceController::class, 'update'])->name('preferences.update');
    });
});
