<?php

use App\Http\Controllers\CommonController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return to_route('login');
});

Route::get('notifications/{notification}', [CommonController::class, 'visitNotification'])->name('notifications.visit');

require __DIR__ . '/customer.php';
require __DIR__ . '/admin.php';
require __DIR__ . '/auth.php';

Route::get('test', function (){

    $dm = str('Ruhea High School')->lower()->explode(' ')->map(function ($item){
        return substr($item, 0, 1);
    })->implode('');

    return $dm;
});
