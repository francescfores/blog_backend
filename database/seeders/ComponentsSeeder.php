<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;

use App\Models\blog\Component\Subcomponent;
use App\Models\blog\Component\SubcomponentAttribute;

use App\Models\blog\Component\Component;
use App\Models\blog\Component\ComponentAttribute;
use App\Models\blog\Component\ComponentType;
use App\Models\blog\Component\ComponentTypeAttribute;
use App\Models\blog\PostImage;
use App\Models\blog\PostTag;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class ComponentsSeeder extends Seeder
{
    public $users; // Propiedad para recibir datos

    public function run(): void
    {
        //post
        $post = Post::create([
            'views' => 0,
            'name' => 'Testing components',
            'subname' => ' Lyft launching cross-platform service this week ',
            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
        ]);
        //category
        $post_category = PostCategory::create([
            'name' => 'general',
            'desc' => 'desc',
            'img' => 'img',
        ]);
         PostCategory::create([
            'name' => 'css',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        PostCategory::create([
            'name' => 'javascript',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        PostCategory::create([
            'name' => 'frameworks',
            'desc' => 'desc',
            'img' => 'img',
        ]);

        $post->category()->associate($post_category);

        //content
        $component_page = Component::create([
            'name' => 'page',
            'desc' => 'desc',
        ]);

        //content type
        $component_page_type = ComponentType::create([
            'name' => 'page',
            'desc' => 'desc',
        ]);
        //component attr
        $component_page_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  justify-center items-center items-center pt-16',
        ]);
        //add type on component
        $component_page->type()->associate($component_page_type);
        //add attrs on component
        $component_page->attributes()->save($component_page_attr);
        $component_page_type->save();
        $component_page->save();
        
        //add comp on post
        $post->components()->save($component_page);
        $post->save();

        $component_container = Component::create([
            'name' => 'container',
            'desc' => 'desc',
        ]);
        $component_container_type = ComponentType::create([
            'name' => 'container',
            'desc' => 'desc',
        ]);
        $component_container_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'container w-full min-h-screen',
        ]);
        $component_container->type()->associate($component_container_type);
        $component_container->attributes()->save($component_container_attr);
        $component_container_type->save();
        $component_container->save();
        $subNew = Subcomponent::create([
                'component_child_id' => $component_container->id,
                'component_parent_id' => $component_page->id,
            ]);

        $component_grid = Component::create([
            'name' => 'grid',
            'desc' => 'desc',
        ]);
        $component_grid_type = ComponentType::create([
            'name' => 'grid',
            'desc' => 'desc',
        ]);
        $component_grid_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'p-4 grid grid-cols-3 bg-bgSeco gap-2',
        ]);
        $component_grid->type()->associate($component_grid_type);
        $component_grid->attributes()->save($component_grid_attr);
        $component_grid_type->save();
        $component_grid->save();
        $subNew2 = Subcomponent::create([
                'component_child_id' => $component_grid->id,
                'subcomponent_id' => $subNew->id,
            ]);
        $subNew->subcomponents()->save($subNew2);



        $component = Component::create([
            'name' => 'card',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'card',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'p-4 rounded bg-bgTern w-full flex flex-col',
        ]);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component_type->save();
        $component->save();
        $subNew3 = Subcomponent::create([
                'component_child_id' => $component->id,
                'subcomponent_id' => $subNew2->id,
            ]);
        $subNew2->subcomponents()->save($subNew3);

        $subNew4 = Subcomponent::create([
                'component_child_id' => $component->id,
                'subcomponent_id' => $subNew2->id,
            ]);
        $subNew2->subcomponents()->save($subNew4);

        $subNew5 = Subcomponent::create([
                'component_child_id' => $component->id,
                'subcomponent_id' => $subNew2->id,
            ]);
        $subNew2->subcomponents()->save($subNew5);


        $component = Component::create([
            'name' => 'text',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'text',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'text-textPrimary text-md text-textPrimary whitespace-pre-line',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'text_label',
            'value' => 'Text',
        ]);
        $component_attr3 = ComponentAttribute::create([
            'name' => 'anchor',
            'value' => 'text',
        ]);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component->attributes()->save($component_attr3);
        $component_type->save();
        $component->save();
 

        $component = Component::create([
            'name' => 'heading',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'heading',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'font-semibold text-3xl md:text-4xl xl:text-5xl text-textPrimary',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'text_label',
            'value' => 'Text',
        ]);
        $component_attr3 = ComponentAttribute::create([
            'name' => 'anchor',
            'value' => 'text',
        ]);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component->attributes()->save($component_attr3);
        $component_type->save();
        $component->save();


         $component = Component::create([
            'name' => 'image',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'image',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => '',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'url',
            'value' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrVLGzO55RQXipmjnUPh09YUtP-BW3ZTUeAA&s',
        ]);

        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component_type->save();
        $component->save();


        $component = Component::create([
            'name' => 'button',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'button',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'flex bg-primary px-4 py-2 rounded w-32 justify-center  items-center text-white',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'label',
            'value' => 'Button',
        ]);

        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component_type->save();
        $component->save();

        $component = Component::create([
            'name' => 'icon',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'icon',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'text-textPrimary fa fa-book',
        ]);

        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component_type->save();
        $component->save();


        $component = Component::create([
            'name' => 'divider',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'divider',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'flex w-full   fill-white',
        ]);

        $component_attr2 = ComponentAttribute::create([
            'name' => 'svg',
            'value' => '<svg class="fill-bgPrim bg-bgSeco" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" >
                <path d="M0 0v99.7C62 69 122.4 48.7 205 66c83.8 17.6 160.5 20.4 240-12 54-22 110-26 173-10a392.2 392.2 0 0 0 222-5c55-17 110.3-36.9 160-27.2V0H0Z" opacity=".5"></path>
                <path d="M0 0v74.7C62 44 122.4 28.7 205 46c83.8 17.6 160.5 25.4 240-7 54-22 110-21 173-5 76.5 19.4 146.5 23.3 222 0 55-17 110.3-31.9 160-22.2V0H0Z"></path>
            </svg>',
        ]);

             Subcomponent::create([
                'component_child_id' => $component->id,
                'component_parent_id' => $component_page->id,
            ]);

        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component_type->save();
        $component->save();


        $component_spacer = Component::create([
            'name' => 'spacer',
            'desc' => 'desc',
        ]);
        $component_spacer_type = ComponentType::create([
            'name' => 'spacer',
            'desc' => 'desc',
        ]);
        $component_spacer_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'py-10 w-full',
        ]);
        $component_spacer->type()->associate($component_spacer_type);
        $component_spacer->attributes()->save($component_spacer_attr);
        $component_spacer_type->save();
        $component_spacer->save();
        $subNew2 = Subcomponent::create([
                'component_child_id' => $component_spacer->id,
                'subcomponent_id' => $subNew->id,
            ]);
        $subNew->subcomponents()->save($subNew2);


        $component = Component::create([
            'name' => 'table_contents',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'table_contents',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'flex flex-col col-span-2 flex-wrap md:sticky md:top-[62px]',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'list',
            'value' => 'title,test 2,item3',
        ]);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component_type->save();
        $component->save();


        $component = Component::create([
            'name' => 'button3d',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'button3d',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => '',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'styles_button',
            'value' => 'btn_secondary',
        ]);
        $component_attr3 = ComponentAttribute::create([
            'name' => 'label',
            'value' => 'Button',
        ]);
        $component_attr4 = ComponentAttribute::create([
            'name' => 'url',
            'value' => 'Button',
        ]);        
        $component_attr5 = ComponentAttribute::create([
            'name' => 'height',
            'value' => '30px',
        ]);
        $component_attr6 = ComponentAttribute::create([
            'name' => 'width',
            'value' => '100px',
        ]);
        $component_attr7 = ComponentAttribute::create([
            'name' => 'raise',
            'value' => '10',
        ]);
        $component_attr8 = ComponentAttribute::create([
            'name' => 'rounded',
            'value' => '10px',
        ]);
        $component_attr9 = ComponentAttribute::create([
            'name' => 'border',
            'value' => '10px',
        ]);
        $component_attr10 = ComponentAttribute::create([
            'name' => 'border_style',
            'value' => 'solid #FF4769 4px',
        ]);
        $component_attr11 = ComponentAttribute::create([
            'name' => 'bg_front_color',
            'value' => '#FF1F48',
        ]);
        $component_attr12 = ComponentAttribute::create([
            'name' => 'bg_shadow_color',
            'value' => 'rgba(217, 217, 217, 0.35);',
        ]);
        $component_attr13 = ComponentAttribute::create([
            'name' => 'bg_back_color',
            'value' => '#E00029',
        ]);
        $component_attr14 = ComponentAttribute::create([
            'name' => 'font_color',
            'value' => '#fff',
        ]);
        $component_attr15 = ComponentAttribute::create([
            'name' => 'font_body_weight',
            'value' => '400',
        ]);
        $component_attr16 = ComponentAttribute::create([
            'name' => 'font_size',
            'value' => '16px',
        ]);
        $component_attr17 = ComponentAttribute::create([
            'name' => 'ripple',
            'value' => 'false',
        ]);

        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component->attributes()->save($component_attr3);
        $component->attributes()->save($component_attr4);
        $component->attributes()->save($component_attr5);
        $component->attributes()->save($component_attr6);
        $component->attributes()->save($component_attr7);
        $component->attributes()->save($component_attr8);
        $component->attributes()->save($component_attr9);
        $component->attributes()->save($component_attr10);
        $component->attributes()->save($component_attr11);
        $component->attributes()->save($component_attr12);
        $component->attributes()->save($component_attr13);
        $component->attributes()->save($component_attr14);
        $component->attributes()->save($component_attr15);
        $component->attributes()->save($component_attr16);
        $component->attributes()->save($component_attr17);
        $component_type->save();
        $component->save();


         $component = Component::create([
            'name' => 'codeplayground',
            'desc' => 'codeplayground',
        ]);
        $component_type = ComponentType::create([
            'name' => 'codeplayground',
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

        $component_type_attr10 = ComponentAttribute::create([
            'name' => 'show_iframe',
            'value' => 'true'
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
        $component->attributes()->save($component_type_attr10);
        $component->save();
        $component_type->save();


        $component = Component::create([
            'name' => 'image3d',
            'desc' => 'desc',
        ]);
        $component_type = ComponentType::create([
            'name' => 'image3d',
            'desc' => 'desc',
        ]);
        $component_attr = ComponentAttribute::create([
            'name' => 'styles',
            'value' => 'py-10 w-full h-full',
        ]);
        $component_attr2 = ComponentAttribute::create([
            'name' => 'img_url',
            'value' => 'https://pngimg.com/uploads/venom/venom_PNG41.png'
        ]);

        $component_attr3 = ComponentAttribute::create([
            'name' => 'img_bg_url',
            'value' => 'https://64.media.tumblr.com/47c08a8cea06364a20db6d3137d221eb/7cbec6d1017fc497-c6/s1280x1920/a4959ce4bff4ed4bfe22b899dc21a22cf8a55a6e.png'
        ]);
        $component->type()->associate($component_type);
        $component->attributes()->save($component_attr);
        $component->attributes()->save($component_attr2);
        $component->attributes()->save($component_attr3);
        $component_type->save();
        $component->save();
    }
}
