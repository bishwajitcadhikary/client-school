<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AttendanceTakenMail extends Mailable
{
    use Queueable, SerializesModels;

    public $students;

    public function __construct($students)
    {
        $this->students = $students;
    }

    public function envelope()
    {
        return new Envelope(
            subject: 'Attendance Taken Mail',
        );
    }


    public function content()
    {
        return new Content(
            markdown: 'mail.attendance-taken-mail',
            with: [
                'students' => $this->students,
            ],
        );
    }
}
