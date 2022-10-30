<?php

namespace App\Notifications;

use App\Models\School;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SendSchoolCredentials extends Notification implements ShouldQueue
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
            ->subject('Your new school credentials')
            ->line('Your new school credentials are:')
            ->line('Email: ' . config('wovo.new_school_admin_mail'))
            ->line('Password: ' . config('wovo.new_school_admin_password'))
            ->action('Visit Now', str($this->school->domain)->prepend('https://'))
            ->line('Thank you for using our application!');
    }

    public function toArray($notifiable)
    {
        return [
            'message' => 'Your new school has been created successfully.',
            'description' => 'Your new school credentials are: Email: ' . config('wovo.new_school_admin_mail') . ' Password: ' . config('wovo.new_school_admin_password'),
            'link' => str($this->school->domain)->prepend('https://'),
        ];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'Your new school has been created successfully.',
            'description' => 'Your new school credentials are: Email: ' . config('wovo.new_school_admin_mail') . ' Password: ' . config('wovo.new_school_admin_password'),
            'link' => str($this->school->domain)->prepend('https://'),
        ];
    }
}
