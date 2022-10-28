<?php

use App\Http\Controllers\Customer;
use Illuminate\Support\Facades\Route;

Route::group(['as' => 'customer.', 'middleware' => ['auth:web', 'verified', 'customer']], function (){
    Route::get('dashboard', [Customer\DashboardController::class, 'index'])->name('dashboard.index');

    Route::get('profile', [Customer\ProfileController::class, 'index'])->name('profile.index');
    Route::put('profile/information', [Customer\ProfileController::class, 'updateProfileInformation'])->name('profile.update-profile-information');
    Route::put('profile/deactivate-account', [Customer\ProfileController::class, 'deactivateAccount'])->name('profile.deactivate-account');
});
