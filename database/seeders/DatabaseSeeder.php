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
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);


        $component_button_type = ComponentType::create([
            'name' => 'button_default',
            'desc' => 'type button',
        ]);
        $component_button = Component::create([
            'name' => 'button',
            'desc' => 'button desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid lg:grid-cols-2 place-items-center pt-16 pb-8 md:pt-12 md:pb-24',
        ]);

        $component_button->attributes()->save($component_attr);
        $component_button->type()->associate($component_button_type);
        $component_button->save();

    }
}
