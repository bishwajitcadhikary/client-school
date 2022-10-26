<?php

namespace Database\Seeders;

use App\Models\Currency;
use Illuminate\Database\Seeder;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $currencies = [
            [
                'name' => 'US Dollar',
                'code' => 'USD',
                'symbol' => '$',
                'precision' => '2',
                'thousand_separator' => ',',
                'decimal_separator' => '.',
                'is_default' => true,
            ],
            [
                'name' => 'British Pound',
                'code' => 'GBP',
                'symbol' => '£',
                'precision' => '2',
                'thousand_separator' => ',',
                'decimal_separator' => '.',
            ],
            [
                'name' => 'Bangladeshi Taka',
                'code' => 'BDT',
                'symbol' => '৳',
                'precision' => '2',
                'thousand_separator' => ',',
                'decimal_separator' => '.',
            ],
        ];

        foreach ($currencies as $currency) {
            Currency::create($currency);
        }
    }
}
