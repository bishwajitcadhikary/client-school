<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Settings\Mail\MailEnvironmentRequest;
use App\Space\EnvironmentManager;
use Inertia\Inertia;

class MailController extends Controller
{
    protected $environmentManager;

    public function __construct(EnvironmentManager $environmentManager)
    {
        $this->environmentManager = $environmentManager;
    }

    public function index()
    {
        $mailConfig = [
            'mail_driver' => config('mail.default'),
            'mail_host' => config('mail.mailers.smtp.host'),
            'mail_port' => config('mail.mailers.smtp.port'),
            'mail_username' => config('mail.mailers.smtp.username'),
            'mail_password' => config('mail.mailers.smtp.password'),
            'mail_encryption' => config('mail.mailers.smtp.encryption'),
            'mail_from_address' => config('mail.from.address'),
            'mail_from_name' => config('mail.from.name'),

            'mail_mailgun_domain' => config('services.mailgun.domain'),
            'mail_mailgun_secret' => config('services.mailgun.secret'),
            'mail_mailgun_endpoint' => config('services.mailgun.endpoint'),

            'mail_ses_key' => config('services.ses.key'),
            'mail_ses_secret' => config('services.ses.secret'),
        ];

        return Inertia::render('Admin/Settings/Mail/Index', [
            'mailConfig' => $mailConfig,
        ]);
    }

    public function update(MailEnvironmentRequest $request)
    {
        $this->environmentManager->saveMailVariables($request);

        \Session::flash('success', 'Mail Configuration Updated Successfully');

        return redirect()->back();
    }
}
