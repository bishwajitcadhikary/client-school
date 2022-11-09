<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DatabaseUpgrade extends Notification
{
    use Queueable;

    public function __construct(
        public \App\Models\DatabaseUpgrade $databaseUpgrade,
        public array|null $success,
        public array|null $failed
    ){}

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Database up upgrade is completed.')
            ->markdown('mail.database-upgrade', [
                'databaseUpgrade' => $this->databaseUpgrade,
                'success' => $this->success,
                'failed' => $this->failed,
            ]);
    }

    public function toDatabase()
    {
        return [
            'message' => __("Database up upgrade is completed."),
            'link' => route('admin.database-upgrades.index')
        ];
    }
}
