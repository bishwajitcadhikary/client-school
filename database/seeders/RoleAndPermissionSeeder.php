<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $mapPermission = collect([
            'c' => 'create',
            'r' => 'read',
            'u' => 'update',
            'd' => 'delete',
        ]);

        $config = collect([
            'Super Admin' => [
                'dashboard' => 'r',
                'roles' => 'c,r,u,d',
                'roles-assign' => 'c,r',
                'languages' => 'c,r,u,d',
                'currencies' => 'c,r,u,d',

                'settings' => 'r',
                'backup' => 'c,r,d',
                'backup-setting' => 'r,u',
                'reset' => 'r,u',
                'restore' => 'r,u',
                'horizon' => 'r',
            ]
        ]);


        foreach ($config as $key => $modules) {

            // Create a new role
            $role = Role::firstOrCreate([
                'name' => $key,
                'guard_name' => 'web',
            ]);
            $permissions = [];

            $this->command->info('Creating Role ' . strtoupper($key));

            // Reading role permission modules
            foreach ($modules as $module => $value) {
                foreach (explode(',', $value) as $p => $perm) {
                    $permissionValue = $mapPermission->get($perm);

                    $permissions[] = Permission::firstOrCreate([
                        'name' => $module . '-' . $permissionValue,
                        'guard_name' => 'web',
                    ])->id;

                    $this->command->info('Creating Permission to ' . $permissionValue . ' for ' . $module);
                }
            }

            // Attach all permissions to the role
            $role->permissions()->sync($permissions);

           /* if (config('permissions.create_users')) {
                $this->command->info("Creating '{$key}' user");
                // Create default user for each role
                $user = \App\Models\User::create([
                    'name' => ucwords(str_replace('_', ' ', $key)),
                    'email' => str($key)->remove(' ')->lower() . '@admin.com',
                    'password' => bcrypt('password'),
                    'username' => str($key)->slug(''),
                    'avatar' => 'https://avatars.dicebear.com/api/adventurer/' . str($key)->slug() . '.svg',
                ]);
                $user->assignRole($role);
            }*/
        }
    }
}
