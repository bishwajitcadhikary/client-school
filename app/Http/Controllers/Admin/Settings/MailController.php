<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Settings\Mail\MailEnvironmentRequest;
use App\Space\Wovo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MailController extends Controller
{
    public function index()
    {
        return Inertia::render('Admin/Settings/Mail/Index');
    }

    public function update(MailEnvironmentRequest $request)
    {
        switch ($request->input('mail_driver')){
            case 'smtp':
                Wovo::setEnvironmentValue([
                    'MAIL_MAILER' => $request->mail_driver,
                    'MAIL_HOST' => $request->smtp['mail_host'] ?? ''
                ]);
                break;

            case 'mail':
                Wovo::setEnvironmentValue([
                    'MAIL_MAILER' => $request->mail_driver,
                    'MAIL_HOST' => '',
                    'MAIL_PORT' => '',
                    'MAIL_USERNAME' => '',
                    'MAIL_PASSWORD' => '',
                    'MAIL_ENCRYPTION' => '',
                    'MAIL_FROM_ADDRESS' => $request->basic['mail_from_address'] ?? null,
                    'MAIL_FROM_NAME' => str($request->basic['mail_from_name'] ?? null)->remove(' ')
                ]);
                dd('wow');
                break;
        }
    }
}
