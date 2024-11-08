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

class ComponentsSeeder_v5 extends Seeder
{
    /**
     * Seed the application's database.
    
    public function run(): void
    {
        //other seeder
        $component6 = Component::create([
            'name' => 'image3d',
            'desc' => 'image3d',
        ]);
        $component6_type = ComponentType::create([
            'name' => 'image3d',
            'desc' => 'image3d',
        ]);

        $component6_type_attr9 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'p-4 relative m-0  rounded-none bg-transparent  shadow-none '
        ]);
        $component6_type_attr2 = ComponentAttribute::create([
            'name' => 'img_url',
            'value' => 'p-4 relative m-0  rounded-none bg-transparent  shadow-none '
        ]);
        $component6_type_attr3 = ComponentAttribute::create([
            'name' => 'img_bg_url',
            'value' => 'p-4 relative m-0  rounded-none bg-transparent  shadow-none '
        ]);
        //$post->components()->save($component6);
        $component6->type()->associate($component6_type);
        $component6->attributes()->save($component6_type_attr9);
        $component6->attributes()->save($component6_type_attr2);
        $component6->attributes()->save($component6_type_attr3);
        $component6_type->save();
        $component6->save();

    }
 */
        public function run(): void
    {
        //other seeder
        $component6 = Component::create([
            'name' => 'table_contents',
            'desc' => 'table_contents',
        ]);
        $component6_type = ComponentType::create([
            'name' => 'table_contents',
            'desc' => 'table_contents',
        ]);

        $component6_type_attr9 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'fa fa-book'
        ]);
        $component6->type()->associate($component6_type);
        $component6->attributes()->save($component6_type_attr9);
        $component6_type->save();
        $component6->save();
    }
}
