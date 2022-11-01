<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $settings = [
            [
                'option' => 'dns_instructions',
                'value' => "You'll need to setup a DNS record to point to your store on our server. DNS records can be setup through your domain registers control panel. Since every registrar has a different setup, contact them for assistance if you're unsure.",
            ],
            [
                'option' => 'support_instructions',
                'value' => "DNS changes may take up to 48-72 hours to take effect, although it's normally a lot faster than that. You will receive a reply when your custom domain has been activated. Please allow 1-2 business days for this process to complete.",
            ],
            [
                'option' => 'currency',
                'value' => 3,
            ],
            [
                'option' => 'language',
                'value' => 'en',
            ],
            [
                'option' => 'date_format',
                'value' => 'DD/MM/YYYY',
            ],
            [
                'option' => 'time_zone',
                'value' => 'Asia/Dhaka',
            ],
            [
                'option' => 'a_ip',
                'value' => request()->ip(),
            ],
            [
                'option' => 'cname_domain',
                'value' => config('wovo.main_domain'),
            ]
        ];

        foreach ($settings as $setting) {
            Setting::updateOrCreate(['option' => $setting['option']], $setting);
        }
    }
}
