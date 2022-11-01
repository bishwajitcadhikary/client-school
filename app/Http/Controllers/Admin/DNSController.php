<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class DNSController extends Controller
{
    public function index()
    {
        $settings = Setting::getSettings(['dns_instructions', 'support_instructions', 'a_ip', 'cname_domain']);

        return Inertia::render('Admin/DNS/Index', [
            'settings' => $settings,
        ]);
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'dns_instructions' => ['required', 'string'],
            'support_instructions' => ['required', 'string'],
            'a_ip' => ['required', 'string'],
            'cname_domain' => ['required', 'string'],
        ]);

        foreach ($data as $option => $value) {
            Setting::updateOrCreate(['option' => $option], [
                'option' => $option,
                'value' => $value,
            ]);
        }

        Session::flash('success', 'DNS Configuration Instruction Updated Successfully.');
    }
}
