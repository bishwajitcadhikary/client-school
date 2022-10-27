<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'username' => fake()->unique()->userName(),
            'phone' => fake()->unique()->e164PhoneNumber(),
            'role' => 'customer',
            'status' => 1,
            'remember_token' => Str::random(10),
            'email_verified_at' => now(),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password

            'website' => fake()->url(),
            'country' => fake()->country(),
            'interval' => fake()->randomElement(['monthly', 'yearly']),
            'plan_expire_at' => now()->addDays(fake()->randomElement([30, 365])),
            'language_id' => 1,
            'plan_id' => fake()->randomElement([1, 2]),
            'currency_id' => fake()->randomElement([1,2,3]),
            'last_login_ip' => fake()->ipv4(),
            'last_login_at' => now(),
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return static
     */
    public function unverified()
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
