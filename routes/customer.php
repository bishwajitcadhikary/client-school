<?php

use App\Http\Controllers\CommonController;
use App\Http\Controllers\Customer;
use Illuminate\Support\Facades\Route;

Route::group(['as' => 'customer.', 'middleware' => ['auth', 'verified', 'customer', 'subscription']], function (){
    Route::get('dashboard', [Customer\DashboardController::class, 'index'])->name('dashboard.index');

    Route::group(['excluded_middleware' => 'subscription'], function (){
        Route::get('profile', [Customer\ProfileController::class, 'index'])->name('profile.index');
        Route::put('profile/information', [Customer\ProfileController::class, 'updateProfileInformation'])->name('profile.update-profile-information');
        Route::put('profile/deactivate-account', [Customer\ProfileController::class, 'deactivateAccount'])->name('profile.deactivate-account');
        Route::put('profile/change-password', [Customer\ProfileController::class, 'changePassword'])->name('profile.change-password');
    });

    Route::resource('schools', Customer\SchoolController::class)->except('show');
    Route::get('orders', [Customer\OrderController::class, 'index'])->name('orders.index');

    Route::group(['prefix' => 'subscription', 'excluded_middleware' => 'subscription'], function (){
        Route::get('/', [Customer\SubscriptionController::class, 'index'])->name('subscription.index');
        Route::get('/{plan}/payment', [Customer\SubscriptionController::class, 'payment'])->name('subscription.payment');
        Route::post('/{plan}/payment', [Customer\SubscriptionController::class, 'paymentStore'])->name('subscription.payment.store');
    });

    Route::get('notifications', [CommonController::class, 'notifications'])->name('notifications.index');
    Route::get('dns', [Customer\DNSController::class, 'index'])->name('dns.index');
});
