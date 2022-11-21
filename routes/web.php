<?php

use App\Http\Controllers\CommonController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return to_route('login');
});

Route::get('notifications/{notification}', [CommonController::class, 'visitNotification'])->name('notifications.visit');

require __DIR__ . '/customer.php';
require __DIR__ . '/admin.php';
require __DIR__ . '/auth.php';

Route::get('test', function (){
    $stellerbd = new \BCA\StellerBD\StellerBD();

    return  $stellerbd->getLog(
        now()->subDays(3)->format('Y-m-d'),
        now()->format('Y-m-d'),
        now()->subDays(3)->format('H:i:s'),
        now()->format('H:i:s')
    );

});
