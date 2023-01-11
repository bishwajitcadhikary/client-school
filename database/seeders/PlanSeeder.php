<?php

namespace Database\Seeders;

use App\Models\Plan;
use Illuminate\Database\Seeder;

class PlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $plans = [
            [
                'name' => 'Free',
                'price' => 0,
                'school_limit' => 1,
                'max_limit' => 0,
                'description' => 'This is a free plan',
                'is_active' => 1,
                'is_trial' => 1,
            ],
            [
                'name' => 'Starter',
                'price' => 100,
                'school_limit' => 5,
                'max_limit' => 0,
                'description' => 'This is premium plan',
                'is_active' => 1,
                'is_trial' => 0,
            ],
        ];

        foreach ($plans as $index => $plan) {
            Plan::create($plan);
        }
    }
}
