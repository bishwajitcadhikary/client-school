<?php

use App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\Settings;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth', 'verified']], function () {
    Route::get('test', function () {
        return \App\Space\Languages::getByCode('en');
    });
    Route::get('dashboard', fn () => Inertia::render('Admin/Dashboard/Index'))->name('dashboard.index');

    //Modules
    Route::put('customers/toggle-suspend/{customer}', [Admin\CustomerController::class, 'toggleSuspend'])->name('customers.toggle-suspend');
    Route::put('customers/change-password/{customer}', [Admin\CustomerController::class, 'changePassword'])->name('customers.change-password');
    Route::resource('customers', Admin\CustomerController::class);

    Route::put('schools/change-status/{school}', [Admin\SchoolController::class, 'changeStatus'])->name('schools.change-status');
    Route::post('schools/database-creation-retry/{school}', [Admin\SchoolController::class, 'databaseCreationRetry'])->name('schools.database-creation-retry');
    Route::resource('schools', Admin\SchoolController::class);

    Route::resource('plans', Admin\PlanController::class);

    Route::group(['prefix' => 'settings', 'as' => 'settings.'], function () {
        Route::resource('file-disks', Settings\FileDiskController::class);
        Route::get('backup/download', [Settings\BackupController::class, 'download'])->name('backups.download');
        Route::resource('backups', Settings\BackupController::class)->except('show', 'edit', 'update');
        Route::get('mail', [Settings\MailController::class, 'index'])->name('mail.index');
        Route::put('mail/update', [Settings\MailController::class, 'update'])->name('mail.update');
        Route::get('preferences', [Settings\PreferenceController::class, 'index'])->name('preferences.index');
        Route::put('preferences/update', [Settings\PreferenceController::class, 'update'])->name('preferences.update');

        Route::get('account-settings', [Settings\AccountController::class, 'index'])->name('account-settings.index');
        Route::put('account-settings', [Settings\AccountController::class, 'update'])->name('account-settings.update');
        Route::put('languages/change-status/{language}', [Settings\LanguageController::class, 'changeStatus'])->name('languages.change-status');
        Route::put('languages/change-default/{language}', [Settings\LanguageController::class, 'changeDefault'])->name('languages.change-default');
        Route::get('languages/edit-phrases/{language}', [Settings\LanguageController::class, 'editPhrases'])->name('languages.edit-phrases');
        Route::put('languages/update-phrases/{language}', [Settings\LanguageController::class, 'updatePhrases'])->name('languages.update-phrases');
        Route::resource('languages', Settings\LanguageController::class);
        Route::put('currencies/change-status/{currency}', [Settings\CurrencyController::class, 'changeStatus'])->name('currencies.change-status');
        Route::put('currencies/change-default/{currency}', [Settings\CurrencyController::class, 'changeDefault'])->name('currencies.change-default');
        Route::put('currencies/sync', [Settings\CurrencyController::class, 'sync'])->name('currencies.sync');
        Route::resource('currencies', Settings\CurrencyController::class);
        Route::resource('gateways', Settings\GatewayController::class);
    });
});
