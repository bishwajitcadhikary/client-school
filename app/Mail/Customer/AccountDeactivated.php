<?php

namespace App\Mail\Customer;

use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AccountDeactivated extends Mailable
{
    use Queueable, SerializesModels;

    public function envelope()
    {
        return new Envelope(
            subject: 'Account Deactivated',
        );
    }

    public function content()
    {
        return new Content(
            markdown: 'mail.customer.account-deactivated',
        );
    }

    public function attachments()
    {
        return [];
    }
}
