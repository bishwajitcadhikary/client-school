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
