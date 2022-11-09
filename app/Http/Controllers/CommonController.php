<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Session;

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

    public function markAllAsRead()
    {
        auth()->user()->unreadNotifications->markAsRead();

        Session::flash('success', __('All notifications marked as read.'));

        return redirect()->back();
    }
}
