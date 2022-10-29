<?php

namespace App\Notifications;

use App\Models\School;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewSchoolAdded extends Notification
{
    use Queueable;

    private School $school;

    public function __construct(School $school)
    {
        $this->school = $school;
    }

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('New school has been added by ' . $this->school->customer->name)
                    ->action('Check School', route('admin.schools.show', $this->school->id))
                    ->line('This is an automated message from '. config('app.name'));
    }

    public function toArray($notifiable)
    {
        return [
            'message' => 'New school has been added by ' . $this->school->customer->name,
            'link' => route('admin.schools.show', $this->school->id)
        ];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'New school has been added by ' . $this->school->customer->name,
            'link' => route('admin.schools.show', $this->school->id)
        ];
    }
}
