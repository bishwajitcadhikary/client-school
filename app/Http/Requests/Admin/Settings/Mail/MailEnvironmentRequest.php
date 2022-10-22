<?php

namespace App\Http\Requests\Admin\Settings\Mail;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class MailEnvironmentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        switch ($this->get('mail_driver')) {
            case 'smtp':
                return [
                    'mail_driver' => ['required', 'in:smtp'],
                    'smtp.mail_host' => [
                        'required',
                        'string',
                    ],
                    'smtp.mail_port' => [
                        'required',
                    ],
                    'smtp.mail_encryption' => [
                        'required',
                        'string',
                    ],
                    'smtp.mail_from_name' => [
                        'required',
                        'string',
                    ],
                    'smtp.mail_from_address' => [
                        'required',
                        'string',
                    ],
                ];
                break;

            case 'mailgun':
                return [
                    'mail_driver' => ['required', 'in:mailgun'],
                    'mailgun.mail_mailgun_domain' => [
                        'required',
                        'string',
                    ],
                    'mailgun.mail_mailgun_secret' => [
                        'required',
                        'string',
                    ],
                    'mailgun.mail_mailgun_endpoint' => [
                        'required',
                        'string',
                    ],
                    'mailgun.mail_from_name' => [
                        'required',
                        'string',
                    ],
                    'mailgun.mail_from_address' => [
                        'required',
                        'string',
                    ],
                ];
                break;

            case 'ses':
                return [
                    'mail_driver' => ['required', 'in:ses'],
                    'ses.mail_host' => [
                        'required',
                        'string',
                    ],
                    'ses.mail_port' => [
                        'required',
                    ],
                    'ses.mail_ses_key' => [
                        'required',
                        'string',
                    ],
                    'ses.mail_ses_secret' => [
                        'required',
                        'string',
                    ],
                    'ses.mail_encryption' => [
                        'nullable',
                        'string',
                    ],
                    'ses.mail_from_name' => [
                        'required',
                        'string',
                    ],
                    'ses.mail_from_mail' => [
                        'required',
                        'string',
                    ],
                ];
                break;

            case 'sendmail':
            case 'mail':
                return [
                    'mail_driver' => ['required', 'in:sendmail,mail'],
                    'basic.mail_from_name' => [
                        'required',
                        'string',
                    ],
                    'basic.mail_from_address' => [
                        'required',
                        'string',
                    ],
                ];
                break;
        }
    }
}
