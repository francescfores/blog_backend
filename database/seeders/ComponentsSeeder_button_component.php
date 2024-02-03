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

class ComponentsSeeder_button_component extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //other seeder
        $component6 = Component::create([
            'name' => 'button',
            'desc' => 'button',
        ]);
        $component6_type = ComponentType::create([
            'name' => 'button',
            'desc' => 'button',
        ]);

        $component_type_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'p-4 relative m-0  rounded-none bg-transparent  shadow-none '
        ]);
        $component_type_attr2 = ComponentAttribute::create([
            'name' => 'styles_button',
            'value' => 'p-4 relative m-0  rounded-none bg-transparent  shadow-none '
        ]);
        $component_type_attr3 = ComponentAttribute::create([
            'name' => 'label',
            'value' => 'button'
        ]);
        $component_type_attr4 = ComponentAttribute::create([
            'name' => 'url',
            'value' => 'www.google.com'
        ]);
        //$post->components()->save($component6);
        $component6->type()->associate($component6_type);
        $component6->attributes()->save($component_type_attr);
        $component6->attributes()->save($component_type_attr2);
        $component6->attributes()->save($component_type_attr3);
        $component6->attributes()->save($component_type_attr4);
        $component6_type->save();
        $component6->save();


    }
}
