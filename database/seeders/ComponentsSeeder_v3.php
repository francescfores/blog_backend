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

class ComponentsSeeder_v3 extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //other seeder
        $component = Component::create([
            'name' => 'codeplayground_v2',
            'desc' => 'codeplayground_v2',
        ]);
        $component_type = ComponentType::create([
            'name' => 'codeplayground_v2',
            'desc' => 'desc',
        ]);
        $component_type_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'w-full',
        ]);
        $component_type_attr1 = ComponentAttribute::create([
            'name' => 'html',
            'value' => '<p>Testing</p>',
        ]);
        $component_type_attr2 = ComponentAttribute::create([
            'name' => 'css',
            'value' => 'p{color:red}',
        ]);
        $component_type_attr3 = ComponentAttribute::create([
            'name' => 'js',
            'value' => "console.log('testing');",
        ]);
        $component_type_attr4 = ComponentAttribute::create([
            'name' => 'height',
            'value' => 'h-[300px]'
        ]);
        $component_type_attr5 = ComponentAttribute::create([
            'name' => 'bg_color_1',
            'value' => 'bg-[#151528]'
        ]);
        $component_type_attr6 = ComponentAttribute::create([
            'name' => 'bg_color_2',
            'value' => 'bg-[#2A2A50]'
        ]);
        $component_type_attr7 = ComponentAttribute::create([
            'name' => 'text_color_1',
            'value' => 'text-[#d8d6ff]'
        ]);
        $component_type_attr8 = ComponentAttribute::create([
            'name' => 'text_color_2',
            'value' => 'text-[#7e73a2]'
        ]);
        $component_type_attr9 = ComponentAttribute::create([
            'name' => 'rounded',
            'value' => 'rounded-lg'
        ]);
        //$post->components()->save($component);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_type_attr);
        $component->attributes()->save($component_type_attr1);
        $component->attributes()->save($component_type_attr2);
        $component->attributes()->save($component_type_attr3);
        $component->attributes()->save($component_type_attr4);
        $component->attributes()->save($component_type_attr5);
        $component->attributes()->save($component_type_attr6);
        $component->attributes()->save($component_type_attr7);
        $component->attributes()->save($component_type_attr8);
        $component->attributes()->save($component_type_attr9);
        $component->save();
        $component_type->save();
    }
}
