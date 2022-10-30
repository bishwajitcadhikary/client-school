<?php

use App\Http\Controllers\CommonController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return to_route('login');
});

Route::get('notifications/{notification}', [CommonController::class, 'visitNotification'])->name('notifications.visit');

Route::get('account-deactivated', function (\Illuminate\Http\Request $request) {
    if ($request->header('Account-Status') == 'Deactivated') {
        return Inertia::render('AccountDeactivated');
    }else{
        abort(404);
    }
})->name('account.deactivated');

require __DIR__.'/customer.php';
require __DIR__.'/admin.php';
require __DIR__.'/auth.php';
