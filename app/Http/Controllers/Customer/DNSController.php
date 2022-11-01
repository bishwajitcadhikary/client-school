<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DNSController extends Controller
{
    public function index()
    {
        $settings = Setting::getSettings(['dns_instructions', 'support_instructions', 'a_ip', 'cname_domain']);

        return Inertia::render('Customer/DNS/Index', [
            'settings' => $settings,
        ]);
    }
}
