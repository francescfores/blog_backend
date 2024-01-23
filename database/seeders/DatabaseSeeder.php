<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;
use App\Models\blog\PostContent;
use App\Models\blog\PostContentType;
use App\Models\blog\PostContentTypeAttribute;
use App\Models\blog\Image;
use App\Models\blog\PostTag;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);


        $user = User::create([
            'id' => '1',
            'name' => 'superadmin',
            'email' => 'superadmin@gmail.com',
            'email_verified_at' => NULL,
            'password' => Hash::make('123456'),
            'phone' => '977502170',
            'address' => 'Calle',
            'firstName' => 'super',
            'lastName' => 'admin',
        ]);

        $role = Role::create(['name' => 'superadmin']);
        $role->givePermissionTo(Permission::all());
        $user->assignRole('superadmin');
        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(Permission::all());
        $role = Role::create(['name' => 'user']);
        $role->givePermissionTo(Permission::all());

        //$this->call(ComponentsSeeder::class);
        $this->call(ComponentsSeeder_v2::class);
    }
}
