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

class ComponentsSeeder_v2_copy extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
/*         //post
        $post = Post::create([
            'name' => 'Building a Magical 3D Button',
            'subname' => 'subname',
            'desc' => "Bet you can't click just once!",
        ]);
        //category
        $post_category = PostCategory::create([
            'name' => 'cat1',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post->category()->associate($post_category); */

        /* //types of components
        $component_grid_type = ComponentType::create([
            'name' => 'grid',
            'desc' => 'type grid',
        ]);
        $component_type_card = ComponentType::create([
            'name' => 'card',
            'desc' => 'desc',
        ]);
        $component_type_text = ComponentType::create([
            'name' => 'text',
            'desc' => 'desc',
        ]);

        //component grid
        $component_grid = Component::create([
            'name' => 'Grid col-1 ',
            'desc' => 'Grid layout 1 colum',
        ]);
        $component_grid->type()->associate($component_grid_type);
        $component_grid->save();
        //component attributes (default)
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-4 gap-4 bg-bgTern text-textPrimary border-4 border-red-200',
        ]);
        $component_grid->attributes()->save($component_attr);

        $component_grid2 = Component::create([
            'name' => 'Grid col-1 ',
            'desc' => 'Grid layout 1 colum',
        ]);
        $component_grid2->type()->associate($component_grid_type);
        $component_grid2->save();
        //component attributes (default)
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-4 gap-4 bg-bgTern text-textPrimary border-4 border-red-200',
        ]);
        $component_grid2->attributes()->save($component_attr);

        //component card
        $component_card = Component::create([
            'name' => 'card 1',
            'desc' => 'card layout'
        ]);
        $component_card->type()->associate($component_type_card);

        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-1 gap-4 bg-bgTern text-textPrimary border-4 border-red-200',
        ]);
        $component_card->attributes()->save($component_attr);

        // Crea un nuevo subcomponente y establece sus atributos
        $subcomponent = new Subcomponent();
        $subcomponent->component_child_id = $component_card->id; // Ajusta el ID del subcomponente hijo según tus necesidades
        // Guarda el subcomponente asociándolo al componente
        $component_grid->subcomponents()->save($subcomponent);

        $subcomponent2 = new Subcomponent();
        $subcomponent2->component_child_id = $component_card->id;
        $subcomponent3 = new Subcomponent();
        $subcomponent3->component_child_id = $component_card->id;
        $component_grid2->subcomponents()->save($subcomponent2);
        $component_grid2->subcomponents()->save($subcomponent3);
        // Crear y asociar un atributo al "card"

        // Obtener el último subcomponente creado
        $subcomponent = Subcomponent::find(1);
        $subcomponent2 = Subcomponent::find(2);
        $subcomponent3 = Subcomponent::find(3);

        // Crear y asociar un atributo al "card"
        $attribute = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'bg-white border-4 border-red-200',
        ]);
        $subcomponent->subcomponent_attributes()->save($attribute);
        $subcomponent->save();
        $attribute = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'bg-white border-4 border-red-200',
        ]);
        $subcomponent2->subcomponent_attributes()->save($attribute);
        $subcomponent2->save();
        $attribute = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'bg-black border-4 border-red-200',
        ]);
        $subcomponent3->subcomponent_attributes()->save($attribute);
        $subcomponent3->save();

        $component_grid->save();
        $component_grid2->subcomponents()->save($subcomponent2);
        $component_grid2->subcomponents()->save($subcomponent3);

        $component_grid2->save();

        //text
        $component_text = Component::create([
            'name' => 'title h1',
            'desc' => 'text components',
        ]);
        $component_text->type()->associate($component_type_text);
        $component_text->save();
        $component_text_attr = ComponentAttribute::create([
            'name' => 'text_label',
            'value' => 'title' ,
        ]);
        $component_text->attributes()->save($component_text_attr);
        $component_text->save();

        $newSubcomponent = new Subcomponent();
        $newSubcomponent->component_child_id = $component_text->id; // Ajusta el ID del subcomponente hijo según tus necesidades
        // Guarda el subcomponente asociándolo al componente
        $component_card->subcomponents()->save($newSubcomponent);
        $component_card->save();

        $component_grid->save();
        $component_grid_type->save(); */
        //$post->save();










        //other type of create subcomponent:
        // Crear un nuevo subcomponente que es un "card" en un "grid"
        /*
        $subcomponent = Subcomponent::create([
            'component_parent_id' => $content_grid->id,
            'component_child_id' => $card->id,
        ]);

        // Añadir atributo personalizado al subcomponente "card"
        $subcomponent_custom_attr = SubcomponentAttribute::create([
            'subcomponent_id' => $subcomponent->id,
            'attribute_name' => 'custom_attribute',
            'attribute_value' => 'Valor personalizado para el card en el grid',
        ]);
        */

        //other seeder
        $component6 = Component::create([
            'name' => 'codeplayground_v2',
            'desc' => 'codeplayground_v2',
        ]);
        $component6_type = ComponentType::create([
            'name' => 'codeplayground_v2',
            'desc' => 'desc',
        ]);
        $component6_type_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'w-full',
        ]);
        $component6_type_attr1 = ComponentAttribute::create([
            'name' => 'html',
            'value' => '<p>Testing</p>',
        ]);
        $component6_type_attr2 = ComponentAttribute::create([
            'name' => 'css',
            'value' => 'p{color:red}',
        ]);
        $component6_type_attr3 = ComponentAttribute::create([
            'name' => 'js',
            'value' => "console.log('testing');",
        ]);
        $component6_type_attr4 = ComponentAttribute::create([
            'name' => 'height',
            'value' => 'h-[300px]'
        ]);
        $component6_type_attr5 = ComponentAttribute::create([
            'name' => 'bg_color_1',
            'value' => 'bg-[#151528]'
        ]);
        $component6_type_attr6 = ComponentAttribute::create([
            'name' => 'bg_color_2',
            'value' => 'bg-[#2A2A50]'
        ]);
        $component6_type_attr7 = ComponentAttribute::create([
            'name' => 'text_color_1',
            'value' => 'text-[#d8d6ff]'
        ]);
        $component6_type_attr8 = ComponentAttribute::create([
            'name' => 'text_color_2',
            'value' => 'text-[#7e73a2]'
        ]);
        $component6_type_attr9 = ComponentAttribute::create([
            'name' => 'rounded',
            'value' => 'rounded-lg'
        ]);
        //$post->components()->save($component6);
        $component6->type()->associate($component6_type);
        $component6->attributes()->save($component6_type_attr);
        $component6->attributes()->save($component6_type_attr1);
        $component6->attributes()->save($component6_type_attr2);
        $component6->attributes()->save($component6_type_attr3);
        $component6->attributes()->save($component6_type_attr4);
        $component6->attributes()->save($component6_type_attr5);
        $component6->attributes()->save($component6_type_attr6);
        $component6->attributes()->save($component6_type_attr7);
        $component6->attributes()->save($component6_type_attr8);
        $component6->attributes()->save($component6_type_attr9);
        $component6->save();
        $component6_type->save();

/* 
        $component7 = Component::create([
            'name' => 'img component',
            'desc' => 'img',
        ]);
        $component7_type = ComponentType::create([
            'name' => 'img',
            'desc' => 'desc',
        ]);
        $component7_type_attr1 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'p-5 relative m-0 w-full shrink-0 overflow-hidden rounded-sm rounded-r-none',
        ]);
        $component7_type_attr2 = ComponentAttribute::create([
            'name' => 'img_styles',
            'value' => 'rounded-xl border-solid border-8 border-neutral-900 h-full w-full object-cover',
        ]);
        $component7_type_attr3 = ComponentAttribute::create([
            'name' => 'num',
            'value' => '0',
        ]);

        $component7_img = Image::create([
            'name' => 'portfolio4.png',
            'url' => 'portfolio4.png',
            'desc' => 'img',
        ]);
        $component7_img2 = Image::create([
            'name' => 'portfolio14.png',
            'url' => 'portfolio14.png',
            'desc' => 'img',
        ]);
        $component7->images()->save($component7_img);
        $component7->images()->save($component7_img2);

        //$post->components()->save($component7);
        $component7->type()->associate($component7_type);
        $component7->attributes()->save($component7_type_attr1);
        $component7->attributes()->save($component7_type_attr2);
        $component7->attributes()->save($component7_type_attr3);
        $component7->save();
        $component7_type->save();
        $post->save(); */

    }
}
