<?php

namespace App\Notifications;

use App\Models\PlanOrder;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewOrderSubmitted extends Notification
{
    use Queueable;

    private PlanOrder $order;

    public function __construct(PlanOrder $order)
    {
        $this->order = $order;
    }

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->line($this->order->customer->name . ' has submitted a new order.')
            ->action('Check Now', route('admin.orders.index'))
            ->line('This is an automated message');
    }

    public function toArray($notifiable)
    {
        return [
            'message' => $this->order->customer->name . ' has submitted a new order.',
            'link' => route('admin.orders.index')
        ];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => $this->order->customer->name . ' has submitted a new order.',
            'link' => route('admin.orders.index')
        ];
    }
}
