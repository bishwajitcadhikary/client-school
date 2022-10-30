<?php

namespace App\Notifications;

use App\Models\PlanOrder;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SendOrderStatusUpdated extends Notification
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
            ->subject('Subscription order status updated')
            ->line('Your subscription order status has been updated.')
            ->action('Check Now', route('customer.subscription.index'))
            ->line('Thank you for using our application!');
    }

    public function toArray($notifiable)
    {
        return [
            'message' => 'Your subscription order status has been updated.',
            'link' => route('customer.subscription.index'),
        ];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'Your subscription order status has been updated.',
            'link' => route('customer.subscription.index'),
        ];
    }
}
