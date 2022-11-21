<?php

// config for BCA/StellerBD
return [
    'url' => env('STELLERBD_URL', 'https://rumytechnologies.com/rams/json_api'), // url of the stellerbd server
    'device_id' => env('STELLERBD_DEVICE_ID'),
    'auth_user' => env('STELLERBD_AUTH_USERNAME'), // Username of your client account
    'auth_code' => env('STELLERBD_AUTH_CODE'), // Contact the device manufacturer to get yours
];
