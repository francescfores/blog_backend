<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;
use App\Models\blog\PostContent;
use App\Models\blog\PostImage;
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

        $post = Post::create([
//            'num' => 'num',
            'name' => 'name',
            'desc' => 'desc',
//            'img' => 'img',
        ]);
        $post_img1 = PostImage::create([
            'name' => 'name',
            'url' => 'desc',
            'desc' => 'img',
        ]);
        $post_content1 = PostContent::create([
            'num' => '1',
            'name' => 'name',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_content2 = PostContent::create([
            'num' => '2',
            'name' => 'name',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_coment1 = PostComment::create([
            'name' => '1',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_coment2 = PostComment::create([
            'name' => 'name2',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_category1 = PostCategory::create([
            'name' => 'cat1',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_category2 = PostCategory::create([
            'name' => 'cat2',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_category3 = PostCategory::create([
            'name' => 'cat3',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_tag1 = PostTag::create([
            'name' => 'name1',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post_tag2 = PostTag::create([
            'name' => 'name2',
            'desc' => 'desc',
            'img' => 'img',
        ]);

        $post->user()->associate($user);
        $post->category()->associate($post_category1);
        $post->tags()->save($post_tag1);
        $post->tags()->save($post_tag2);

        $post->contents()->save($post_content1);
        $post->contents()->save($post_content2);
        $post->comments()->save($post_coment1);
        $post->comments()->save($post_coment2);
        $post->images()->save($post_img1);
        $post->save();

    }
}
