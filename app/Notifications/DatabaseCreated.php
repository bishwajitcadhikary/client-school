<?php

namespace App\Notifications;

use App\Models\School;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DatabaseCreated extends Notification
{
    use Queueable;

    private School $school;

    public function __construct(School $school)
    {
        $this->school = $school;
    }

    public function via($notifiable)
    {
        return ['mail','database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line(__(":school database has been created successfully", ['school' => $this->school->name]))
                    ->line('Notification from system');
    }

    public function toArray($notifiable)
    {
        return [
            'message' => __(":school database has been created successfully", ['school' => $this->school->name]),
            'link' => route('admin.schools.index')
        ];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => __(":school database has been created successfully", ['school' => $this->school->name]),
            'link' => route('admin.schools.index')
        ];
    }
}
