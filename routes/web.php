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

/*Route::get('test', function (){
    DB::connection('school')->statement('CREATE DATABASE bilash');
    DB::connection('school')->disconnect();
    Config::set([
        'database.connections.school.database' => 'bilash'
    ]);
    DB::connection('school')->unprepared(file_get_contents(storage_path('school.sql')));
});*/
