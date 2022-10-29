<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            CurrencySeeder::class,
            LanguageSeeder::class,
            FileDiskSeeder::class,
            GatewaySeeder::class,
            PlanSeeder::class,
            UserSeeder::class,
            SettingSeeder::class,
        ]);
    }
}
