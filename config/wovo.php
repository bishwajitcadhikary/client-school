<?php

return [
    'sub_domain_db_prefix' => env('SUB_DOMAIN_DB_PREFIX', 'sub_'),
    'email_send_to' => env('EMAIL_SEND_TO', 'no-reply@mail.com'),
    'plan_trial_duration' => env('PLAN_TRIAL_DURATION', 30),
    'api_layer_key' => env('API_LAYER_KEY', false),
    'show_repcaptcha' => env('SHOW_REPCAPTCHA', false),
    'recaptcha_site_key' => env('RECAPTCHA_SITE_KEY', null),
    'recaptcha_secret_key' => env('RECAPTCHA_SECRET_KEY', null),
    'financial_years' => [
        ['key' => 'january-december', 'value' => '1-12'],
        ['key' => 'february-january', 'value' => '2-1'],
        ['key' => 'march-february', 'value' => '3-2'],
        ['key' => 'april-march', 'value' => '4-3'],
        ['key' => 'may-april', 'value' => '5-4'],
        ['key' => 'june-may', 'value' => '6-5'],
        ['key' => 'july-june', 'value' => '7-6'],
        ['key' => 'august-july', 'value' => '8-7'],
        ['key' => 'september-august', 'value' => '9-8'],
        ['key' => 'october-september', 'value' => '10-9'],
        ['key' => 'november-october', 'value' => '11-10'],
        ['key' => 'december-november', 'value' => '12-11'],
    ],
    'new_school_admin_mail' => env('NEW_SCHOOL_ADMIN_MAIL', 'admin@mail.com'),
    'new_school_admin_password' => env('NEW_SCHOOL_ADMIN_PASSWORD', 'password'),
    'main_domain' => env('MAIN_DOMAIN', parse_url(env('app_url'))['path'] ?? null),
    'free_plan_duration' => env('FREE_PLAN_DURATION', 30),
];
