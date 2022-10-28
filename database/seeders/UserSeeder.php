<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = User::create([
            'name' => 'Super Admin',
            'email' => 'superadmin@mail.com',
            'username' => 'superadmin',
            'role' => 'admin',
            'phone' => '0123456789',
            'email_verified_at' => now(),
            'password' => bcrypt('password'),
            'language_id' => 1,
        ]);
    }
}
