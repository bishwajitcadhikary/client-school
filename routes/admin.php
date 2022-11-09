<?php

use App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\Settings;
use App\Http\Controllers\CommonController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth', 'verified', 'admin']], function () {
    Route::get('dashboard', [Admin\DashboardController::class,'index'])->name('dashboard.index');

    //Modules
    Route::put('customers/toggle-suspend/{customer}', [Admin\CustomerController::class, 'toggleSuspend'])->name('customers.toggle-suspend');
    Route::put('customers/change-password/{customer}', [Admin\CustomerController::class, 'changePassword'])->name('customers.change-password');
    Route::resource('customers', Admin\CustomerController::class);

    Route::put('schools/change-status/{school}', [Admin\SchoolController::class, 'changeStatus'])->name('schools.change-status');
    Route::post('schools/database-creation-retry/{school}', [Admin\SchoolController::class, 'databaseCreationRetry'])->name('schools.database-creation-retry');
    Route::get('schools/database-download/{school}', [Admin\SchoolController::class, 'databaseDownload'])->name('schools.database-download');
    Route::resource('schools', Admin\SchoolController::class);

    Route::resource('plans', Admin\PlanController::class);

    Route::get('database-upgrades/download-backup', [Admin\DatabaseUpgradeController::class, 'downloadBackup'])->name('database-upgrades.download-backup');
    Route::resource('database-upgrades', Admin\DatabaseUpgradeController::class);

    Route::group(['prefix' => 'orders'], function (){
        Route::get('/', [Admin\OrderController::class, 'index'])->name('orders.index');
        Route::put('accept/{order}', [Admin\OrderController::class, 'accept'])->name('orders.accept');
    });

    Route::get('notifications', [CommonController::class, 'notifications'])->name('notifications.index');
    Route::get('notifications/mark-all-as-read', [CommonController::class, 'markAllAsRead'])->name('notifications.mark-all-as-read');

    Route::get('dns', [Admin\DNSController::class, 'index'])->name('dns.index');
    Route::put('dns', [Admin\DNSController::class, 'update'])->name('dns.update');

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
