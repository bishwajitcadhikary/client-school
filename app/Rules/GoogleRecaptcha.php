<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\Http;

class GoogleRecaptcha implements Rule
{
    const URL = 'https://www.google.com/recaptcha/api/siteverify';

    public function __construct()
    {
        //
    }

    public function passes($attribute, $value)
    {
        if (!config('wovo.show_repcaptcha')) {
            return true;
        }

        if (!config('wovo.recaptcha_secret_key')) {
            return false;
        }

        return Http::asForm()->post(static::URL, [
            'secret' => config('wovo.recaptcha_secret_key'),
            'response' => $value,
            'remoteip' => request()->ip()
        ])->json()['success'];
    }

    public function message()
    {
        return 'Google reCAPTCHA validation failed.';
    }
}
