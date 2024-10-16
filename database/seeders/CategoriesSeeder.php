<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;
use App\Models\blog\PostContent;
use App\Models\blog\PostContentAttribute;
use App\Models\blog\PostContentType;
use App\Models\blog\PostContentTypeAttribute;
use App\Models\blog\PostImage;
use App\Models\blog\PostTag;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class CategoriesSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
       
        //category
        /* $post_category = PostCategory::create([
            'name' => 'general',
            'desc' => 'general',
            'img' => 'img',
        ]);
        $post_category = PostCategory::create([
            'name' => 'css',
            'desc' => 'css',
            'img' => 'img',
        ]);
        $post_category = PostCategory::create([
            'name' => 'javascript',
            'desc' => 'css',
            'img' => 'img',
        ]);
        $post_category = PostCategory::create([
            'name' => 'animation',
            'desc' => 'animation',
            'img' => 'img',
        ]); */
        /* $post_category = PostCategory::create([
            'name' => 'frameworks',
            'desc' => 'frameworks',
            'img' => 'img',
        ]); */
        /* $post_category = PostCategory::create([
            'name' => 'performance',
            'desc' => 'performance',
            'img' => 'img',
        ]); */
    }
}
