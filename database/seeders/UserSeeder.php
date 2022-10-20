<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
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
            'phone' => '0123456789',
            'email_verified_at' => now(),
            'password' => bcrypt('password')
        ]);

        $admin->assignRole(['Super Admin']);
    }
}
