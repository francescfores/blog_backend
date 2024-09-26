<?php

namespace Database\Seeders;

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

class ComponentsSeeder_v2 extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Crear un post
        $post = Post::create([
            'name' => 'Building a Magical 3D Button',
            'subname' => 'subname',
            'desc' => "Bet you can't click just once!",
        ]);

        // Crear una categoría de post
        $post_category = PostCategory::create([
            'name' => 'cat1',
            'desc' => 'desc',
            'img' => 'img',
        ]);

        $post->category()->associate($post_category);

        // Crear tipos de componentes
        $component_grid_page = ComponentType::create([
            'name' => 'page',
            'desc' => 'type page',
        ]);

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

        // Crear componentes
        $component_page = Component::create([
            'name' => 'Page',
            'desc' => 'Page',
        ]);
        $post->components()->save($component_page);
        $post->save();

        $component_page->type()->associate($component_grid_page);
        $component_attr1 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'max-w-screen-xl mx-auto px-5',
        ]);
        $component_page->attributes()->save($component_attr1);
        $component_page->save();

        $component_grid = Component::create([
            'name' => 'Grid col-1 ',
            'desc' => 'Grid layout 1 column',
        ]);
        $component_grid->type()->associate($component_grid_type);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid lg:grid-cols-2 place-items-center pt-16 pb-8 md:pt-12 md:pb-24',
        ]);
        $component_grid->attributes()->save($component_attr2);
        $component_grid->save();

        $component_card = Component::create([
            'name' => 'card 1',
            'desc' => 'card component'
        ]);
        $component_card->type()->associate($component_type_card);
        $component_attr3 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-1 gap-4 bg-bgTern text-textPrimary border-4 border-red-200',
        ]);
        $component_card->attributes()->save($component_attr3);
        $component_card->save();

        $component_text = Component::create([
            'name' => 'title h1',
            'desc' => 'title component',
        ]);
        $component_text->type()->associate($component_type_text);
        $component_attr4 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'text-5xl lg:text-6xl xl:text-7xl font-bold lg:tracking-tight xl:tracking-tighter',
        ]);
        $component_text_attr = ComponentAttribute::create([
            'name' => 'text_label',
            'value' => 'title',
        ]);
        $component_text->attributes()->save($component_attr4);
        $component_text->attributes()->save($component_text_attr);
        $component_text->save();


        $component_text2 = Component::create([
            'name' => 'text p',
            'desc' => 'text component',
        ]);
        $component_text2->type()->associate($component_type_text);
        $component_attr4 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'text-lg mt-4 text-slate-600 max-w-xl',
        ]);
        $component_text_attr = ComponentAttribute::create([
            'name' => 'text_label',
            'value' => 'text',
        ]);
        $component_text2->attributes()->save($component_attr4);
        $component_text2->attributes()->save($component_text_attr);
        $component_text2->save();
        // Atributos para el "card"




         $subgrid = Subcomponent::create([
            'component_child_id' => $component_grid->id,
            'component_parent_id' => $component_page->id,
        ]);

        $subcard = Subcomponent::create([
            'component_child_id' => $component_card->id,
            'subcomponent_id' => $subgrid->id,
        ]);
        $subgrid->subcomponents()->save($subcard);

        $attribute1 = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'bg-white border-4 border-red-200',
        ]);
        $subcard->subcomponent_attributes()->save($attribute1);
        $subcard->save();

        $subtext = Subcomponent::create([
            'component_child_id' => $component_text->id,
            'subcomponent_id' => $subcard->id,
        ]);
        $subcard->subcomponents()->save($subtext);

        $attribute2 = SubcomponentAttribute::create([
            'name' => 'text_label',
            'value' => 'Marketing website done with Astro',
        ]);
        $subtext->subcomponent_attributes()->save($attribute2);
        $subtext->save();

        $subtext2 = Subcomponent::create([
            'component_child_id' => $component_text2->id,
            'subcomponent_id' => $subcard->id,
        ]);
        $subcard->subcomponents()->save($subtext2);
        $attribute3 = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'text-lg mt-4 text-slate-600 max-w-xl',
        ]);
        $subtext2->subcomponent_attributes()->save($attribute3);
        $subtext2->save();


        // Más componentes
        $component_img = Component::create([
            'name' => 'img component',
            'desc' => 'img',
        ]);

        $component_img_type = ComponentType::create([
            'name' => 'img',
            'desc' => 'desc',
        ]);

        $component_img_type_attr1 = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'w-full h-full',
        ]);

        $component_img_type_attr2 = ComponentAttribute::create([
            'name' => 'url',
            'value' => 'day92-freelancing.svg',
        ]);

        $component_img->type()->associate($component_img_type);
        $component_img->attributes()->save($component_img_type_attr1);
        $component_img->attributes()->save($component_img_type_attr2);
        $component_img->save();

      /*   $subcard2 = Subcomponent::create([
            'component_child_id' => $component_card->id,
            'subcomponent_id' => $subgrid->id,
        ]);

        $attribute3 = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'flex w-full py-6 md:order-1 hidden md:block',
        ]);

        $subcard2->subcomponent_attributes()->save($attribute3);
        $subcard2->save();

        $subimg = Subcomponent::create([
            'component_child_id' => $component_img->id,
            'subcomponent_id' => $subcard2->id,
        ]);

        $subcard2->subcomponents()->save($subimg);
        $subcard2->save();
        $subgrid->subcomponents()->save($subcard2);
        $subgrid->save();



        $subcard = Subcomponent::create([
            'component_child_id' => $component_card->id,
            'component_parent_id' => $component_page->id,
        ]);

        $attribute1 = SubcomponentAttribute::create([
            'name' => 'styles',
            'value' => 'bg-white border-4 border-red-200',
        ]);
        $subcard->subcomponent_attributes()->save($attribute1);
        $subcard->save();

        $subtext = Subcomponent::create([
            'component_child_id' => $component_text->id,
            'subcomponent_id' => $subcard->id,
        ]);
        $subcard->subcomponents()->save($subtext);

        $attribute2 = SubcomponentAttribute::create([
            'name' => 'text_label',
            'value' => 'Everything you need to start a website',
        ]);
        $subtext->subcomponent_attributes()->save($attribute2);
        $subtext->save();

        $subtext2 = Subcomponent::create([
            'component_child_id' => $component_text2->id,
            'subcomponent_id' => $subcard->id,
        ]);
        $subcard->subcomponents()->save($subtext2);
        $attribute3 = SubcomponentAttribute::create([
            'name' => 'text_label',
            'value' => 'Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',
        ]);
        $subtext2->subcomponent_attributes()->save($attribute3);
        $subtext2->save(); */
    }
}
