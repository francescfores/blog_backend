<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Component\Component;
use App\Models\blog\Component\ComponentAttribute;
use App\Models\blog\Component\ComponentType;
use App\Models\blog\Component\Subcomponent;
use App\Models\blog\Component\SubcomponentAttribute;
use App\Models\blog\Image;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;
use App\Models\blog\PostTag;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class ComponentsSeeder_v4 extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //other seeder
        $component6 = Component::create([
            'name' => 'main',
            'desc' => 'main',
        ]);
        $component6_type = ComponentType::create([
            'name' => 'main',
            'desc' => 'desc',
        ]);

        $component6_type_attr9 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'max-w-screen-xl mx-auto px-5'
        ]);
        //$post->components()->save($component6);
        $component6->type()->associate($component6_type);
        $component6->attributes()->save($component6_type_attr9);
        $component6->save();
        $component6_type->save();
    }
}
