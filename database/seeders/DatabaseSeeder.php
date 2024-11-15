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

use App\Models\blog\Component\Component;
use App\Models\blog\Component\ComponentAttribute;
use App\Models\blog\Component\ComponentType;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        //roles
        $role = Role::create(['name' => 'superadmin']);
        $role->givePermissionTo(Permission::all());
        $user->assignRole('superadmin');
        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(Permission::all());
        $role = Role::create(['name' => 'user']);
        $role->givePermissionTo(Permission::all());

        $user2->assignRole('admin');
        $user3->assignRole('admin');

    }
}
