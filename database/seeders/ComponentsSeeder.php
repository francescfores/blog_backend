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

class ComponentsSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //post
        $post = Post::create([
            'name' => 'Testing components',
            'subname' => ' Lyft launching cross-platform service this week ',
            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
        ]);
        //category
        $post_category = PostCategory::create([
            'name' => 'cat1',
            'desc' => 'desc',
            'img' => 'img',
        ]);
        $post->category()->associate($post_category);



        //content grid
        $content_grid = PostContent::create([
            'num' => 'grid 1',
            'name' => 'Grid 1',
            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
            'img' => 'img',
        ]);
        $post->contents()->save($content_grid);
        $post->save();
        $content_grid2 = PostContent::create([
            'num' => 'grid 2',
            'name' => 'Grid 2',
            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
            'img' => 'img',
        ]);
        $post->contents()->save($content_grid2);
        $post->save();

        //content img
        $content_grid_img = PostImage::create([
            'name' => 'portfolio14.png',
            'url' => 'portfolio14.png',
            'desc' => 'img',
        ]);
        $content_grid->images()->save($content_grid_img);

        //content type
        $content_grid_type = PostContentType::create([
            'name' => 'grid',
            'desc' => 'desc',
        ]);
        $content_grid->type()->associate($content_grid_type);
        $content_grid->save();
        $content_grid2->type()->associate($content_grid_type);
        $content_grid2->save();

        //content type attributes (default)
        $content_grid_type_attr = PostContentTypeAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-4 gap-4 bg-bgTern text-textPrimary',
        ]);
        $content_grid_type->attributes()->save($content_grid_type_attr);
        //content attributes (overide)
        $content_grid_attr = PostContentAttribute::create([
            'name' => 'styles',
            'value' => 'grid grid-cols-5 gap-4 bg-bgTern text-textPrimary',
        ]);
        $content_grid->attributes()->save($content_grid_attr);

        $content_grid->save();
        $content_grid_type->save();
        $post->save();


        $post_content_type_card = PostContentType::create([
            'name' => 'card',
            'desc' => 'desc',
        ]);
        $post_content_type_card_attr = PostContentTypeAttribute::create([
            'name' => 'styles',
            'value' => 'w-full flex flex-col gap-5 p-5 rounded-sm mt-5 bg-primary rounded-lg' ,
        ]);
        $post_content_type_card->attributes()->save($post_content_type_card_attr);
        $post_content_type_card->save();

        $post_content_type_text = PostContentType::create([
            'name' => 'text',
            'desc' => 'desc',
        ]);
        $post_content_type_text_attr = PostContentTypeAttribute::create([
            'name' => 'styles',
            'value' => 'w-full flex flex-col gap-5 p-5 rounded-sm mt-5 bg-primary' ,
        ]);
        $post_content_type_text->attributes()->save($post_content_type_text_attr);
        $post_content_type_text_attr = PostContentTypeAttribute::create([
            'name' => 'text_label',
            'value' => 'epaaaaaaaa' ,
        ]);
        $post_content_type_text->attributes()->save($post_content_type_text_attr);
        $post_content_type_text->save();
        //add 4 card in to grid
        for($i=0;$i<4;$i++){
            //card
            $post_content_card = PostContent::create([
                'num' => '1',
                'name' => 'Card component',
                'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
                'img' => 'img',
            ]);
//        $post->contents()->save($post_content_card);
            $post_content_card->type()->associate($post_content_type_card);
            $post_content_card->save();
            $content_grid->subcontents()->save($post_content_card);
            $content_grid->save();

            //text
            $post_content_text = PostContent::create([
                'num' => '1',
                'name' => 'Text components',
                'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
                'img' => 'img',
            ]);
            $post_content_text->type()->associate($post_content_type_text);
            $post_content_text->save();

//            $post_content_text_attr = PostContentAttribute::create([
//                'name' => 'text_label',
//                'value' => 'overrider' ,
//            ]);
//            $post_content_text->attributes()->save($post_content_text_attr);

            $post_content_text->save();

            $post_content_card->subcontents()->save($post_content_text);
            $post_content_card->save();
        }
        for($i=0;$i<4;$i++){
            //card
            $post_content_card = PostContent::create([
                'num' => '1',
                'name' => 'Card component',
                'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
                'img' => 'img',
            ]);
//        $post->contents()->save($post_content_card);
            $post_content_card->type()->associate($post_content_type_card);
            $post_content_card->save();
            $content_grid2->subcontents()->save($post_content_card);
            $content_grid2->save();

            //text
            $post_content_text = PostContent::create([
                'num' => '1',
                'name' => 'Text components',
                'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
                'img' => 'img',
            ]);
            $post_content_text->type()->associate($post_content_type_text);
            $post_content_text->save();

//            $post_content_text_attr = PostContentAttribute::create([
//                'name' => 'text_label',
//                'value' => 'overrider' ,
//            ]);
//            $post_content_text->attributes()->save($post_content_text_attr);

            $post_content_text->save();

            $post_content_card->subcontents()->save($post_content_text);
            $post_content_card->save();
        }

        $post_content_text_attr = PostContentAttribute::create([
            'name' => 'text_label',
            'value' => 'overrider' ,
        ]);
        $post_content_text->attributes()->save($post_content_text_attr);


        $content_grid->save();
        $content_grid_type->save();
        $post->save();

    }
}
