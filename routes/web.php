<?php

use App\Http\Controllers\CommonController;
use App\Models\Sass\Enroll;
use App\Models\Sass\StudentAttendance;
use App\Models\School;
use App\Space\StellarBD;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return to_route('login');
});

Route::get('notifications/{notification}', [CommonController::class, 'visitNotification'])->name('notifications.visit');

require __DIR__ . '/customer.php';
require __DIR__ . '/admin.php';
require __DIR__ . '/auth.php';

Route::get('test2', function (){
    $stellarBD = new StellarBD('lki8ml13yboxx34gq29i72hnhgku3c', 'edusofto');
return    $log = $stellarBD->getLog();

});
