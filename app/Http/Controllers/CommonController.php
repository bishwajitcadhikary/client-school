<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class CommonController extends Controller
{
    public function visitNotification($notificationId)
    {
        $notification = auth()->user()->notifications()->findOrFail($notificationId);
        $notification->markAsRead();
        return redirect($notification->data['link']);
    }

    public function notifications()
    {
        $notifications = auth()->user()->notifications()->latest()->paginate(10);
        return Inertia::render('Notifications', [
            'notifications' => $notifications
        ]);
    }
}
