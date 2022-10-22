<?php

namespace App\Space;

use App\Http\Requests\Admin\Settings\Mail\MailEnvironmentRequest;
use Exception;

class EnvironmentManager
{
    private $envPath;


    public function __construct()
    {
        $this->envPath = base_path('.env');
    }

    public function saveMailVariables(MailEnvironmentRequest $request)
    {
        $mailData = $this->getMailData($request);

        try {
            file_put_contents($this->envPath, str_replace(
                $mailData['old_mail_data'],
                $mailData['new_mail_data'],
                file_get_contents($this->envPath)
            ));

            if ($mailData['extra_old_mail_data']) {
                file_put_contents($this->envPath, str_replace(
                    $mailData['extra_old_mail_data'],
                    $mailData['extra_mail_data'],
                    file_get_contents($this->envPath)
                ));
            } else {
                file_put_contents(
                    $this->envPath,
                    "\n".$mailData['extra_mail_data'],
                    FILE_APPEND
                );
            }
        } catch (Exception $e) {
            return [
                'error' => 'mail_variables_save_error',
            ];
        }

        return [
            'success' => 'mail_variables_save_successfully',
        ];
    }
    private function getMailData($request)
    {
        $mailFromCredential = "";
        $extraMailData = "";
        $extraOldMailData = "";
        $oldMailData = "";
        $newMailData = "";

        if (env('MAIL_FROM_ADDRESS') !== null && env('MAIL_FROM_NAME') !== null) {
            $mailFromCredential =
                'MAIL_FROM_ADDRESS='.config('mail.from.address')."\n".
                'MAIL_FROM_NAME="'.config('mail.from.name')."\"\n\n";
        }

        switch ($request->mail_driver) {
            case 'smtp':

                $oldMailData =
                    'MAIL_MAILER='.config('mail.default')."\n".
                    'MAIL_HOST='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_PORT='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_USERNAME='.config('mail.mailers.smtp.username')."\n".
                    'MAIL_PASSWORD='.config('mail.mailers.smtp.password')."\n".
                    'MAIL_ENCRYPTION='.config('mail.mailers.smtp.encryption')."\n".
                    $mailFromCredential;

                $smtp = optional($request->smtp);
                $newMailData =
                    'MAIL_MAILER='.$request->mail_driver."\n".
                    'MAIL_HOST='.$smtp['mail_host']."\n".
                    'MAIL_PORT='.$smtp['mail_port']."\n".
                    'MAIL_USERNAME='.$smtp['mail_username']."\n".
                    'MAIL_PASSWORD='.$smtp['mail_password']."\n".
                    'MAIL_ENCRYPTION='.$smtp['mail_encryption']."\n".
                    'MAIL_FROM_ADDRESS='.$smtp['mail_from_address']."\n".
                    'MAIL_FROM_NAME="'.$smtp['mail_from_name']."\"\n\n";

                break;

            case 'mailgun':
                $oldMailData =
                    'MAIL_MAILER='.config('mail.default')."\n".
                    'MAIL_HOST='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_PORT='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_USERNAME='.config('mail.mailers.smtp.username')."\n".
                    'MAIL_PASSWORD='.config('mail.mailers.smtp.password')."\n".
                    'MAIL_ENCRYPTION='.config('mail.mailers.smtp.encryption')."\n".
                    $mailFromCredential;

                $mailgun = optional($request->mailgun);
                $newMailData =
                    'MAIL_MAILER='.$request->mail_driver."\n".
                    'MAIL_HOST='.$mailgun['mail_host']."\n".
                    'MAIL_PORT='.$mailgun['mail_port']."\n".
                    'MAIL_USERNAME='.config('mail.username')."\n".
                    'MAIL_PASSWORD='.config('mail.password')."\n".
                    'MAIL_ENCRYPTION='.$mailgun['mail_encryption']."\n".
                    'MAIL_FROM_ADDRESS='.$mailgun['mail_from_address']."\n".
                    'MAIL_FROM_NAME="'.$mailgun['mail_from_name']."\"\n\n";

                $extraMailData =
                    'MAILGUN_DOMAIN='.$mailgun['mail_mailgun_domain']."\n".
                    'MAILGUN_SECRET='.$mailgun['mail_mailgun_secret']."\n".
                    'MAILGUN_ENDPOINT='.$mailgun['mail_mailgun_endpoint']."\n";

                if (env('MAILGUN_DOMAIN') !== null && env('MAILGUN_SECRET') !== null && env('MAILGUN_ENDPOINT') !== null) {
                    $extraOldMailData =
                        'MAILGUN_DOMAIN='.config('services.mailgun.domain')."\n".
                        'MAILGUN_SECRET='.config('services.mailgun.secret')."\n".
                        'MAILGUN_ENDPOINT='.config('services.mailgun.endpoint')."\n";
                }

                break;

            case 'ses':
                $oldMailData =
                    'MAIL_MAILER='.config('mail.default')."\n".
                    'MAIL_HOST='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_PORT='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_USERNAME='.config('mail.mailers.smtp.username')."\n".
                    'MAIL_PASSWORD='.config('mail.mailers.smtp.password')."\n".
                    'MAIL_ENCRYPTION='.config('mail.mailers.smtp.encryption')."\n".
                    $mailFromCredential;

                $ses = optional($request->ses);
                $newMailData =
                    'MAIL_MAILER='.$request->mail_driver."\n".
                    'MAIL_HOST='.$ses['mail_host']."\n".
                    'MAIL_PORT='.$ses['mail_port']."\n".
                    'MAIL_USERNAME='.config('mail.username')."\n".
                    'MAIL_PASSWORD='.config('mail.password')."\n".
                    'MAIL_ENCRYPTION='.$ses['mail_encryption']."\n\n".
                    'MAIL_FROM_ADDRESS='.$ses['mail_from_mail']."\n".
                    'MAIL_FROM_NAME="'.$ses['mail_from_name']."\"\n";

                $extraMailData =
                    'SES_KEY='.$ses['mail_ses_key']."\n".
                    'SES_SECRET='.$ses['mail_ses_secret']."\n";

                if (env('SES_KEY') !== null && env('SES_SECRET') !== null) {
                    $extraOldMailData =
                        'SES_KEY='.config('services.ses.key')."\n".
                        'SES_SECRET='.config('services.ses.secret')."\n";
                }

                break;

            case 'sendmail':
            case 'mail':
                $basic = optional($request->basic);
                $oldMailData =
                    'MAIL_MAILER='.config('mail.default')."\n".
                    'MAIL_HOST='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_PORT='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_USERNAME='.config('mail.mailers.smtp.username')."\n".
                    'MAIL_PASSWORD='.config('mail.mailers.smtp.password')."\n".
                    'MAIL_ENCRYPTION='.config('mail.mailers.smtp.encryption')."\n".
                    $mailFromCredential;

                $newMailData =
                    'MAIL_MAILER='.$request->mail_driver."\n".
                    'MAIL_HOST='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_PORT='.config('mail.mailers.smtp.host')."\n".
                    'MAIL_USERNAME='.config('mail.mailers.smtp.username')."\n".
                    'MAIL_PASSWORD='.config('mail.mailers.smtp.password')."\n".
                    'MAIL_ENCRYPTION='.config('mail.mailers.smtp.encryption')."\n".
                    'MAIL_FROM_ADDRESS='.$basic['mail_from_address']."\n".
                    'MAIL_FROM_NAME="'.$basic['mail_from_name']."\"\n\n";

                break;

        }

        return [
            'old_mail_data' => $oldMailData,
            'new_mail_data' => $newMailData,
            'extra_mail_data' => $extraMailData,
            'extra_old_mail_data' => $extraOldMailData,
        ];
    }
}
