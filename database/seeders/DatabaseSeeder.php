<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostComment;
use App\Models\blog\PostContent;
use App\Models\blog\PostContentType;
use App\Models\blog\PostContentTypeAttribute;
use App\Models\blog\PostImage;
use App\Models\blog\PostTag;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

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


        $user = User::create([
            'id' => '1',
            'name' => 'superadmin',
            'email' => 'superadmin@gmail.com',
            'email_verified_at' => NULL,
            'password' => Hash::make('123456'),
            'phone' => '977502170',
            'address' => 'Calle',
            'firstName' => 'super',
            'lastName' => 'admin',
        ]);

        $role = Role::create(['name' => 'superadmin']);
        $role->givePermissionTo(Permission::all());
        $user->assignRole('superadmin');
        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(Permission::all());
        $role = Role::create(['name' => 'user']);
        $role->givePermissionTo(Permission::all());

//        $post = Post::create([
////            'num' => 'num',
//            'name' => ' Lyft launching 1',
//            'subname' => ' Lyft launching cross-platform service this week ',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
////            'img' => 'img',
//        ]);
//        $post2 = Post::create([
////            'num' => 'num',
//            'name' => ' Lyft launching 2',
//            'subname' => ' Lyft launching cross-platform service this week ',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
////            'img' => 'img',
//        ]);
//        $post3 = Post::create([
////            'num' => 'num',
//            'name' => ' Lyft launching 3',
//            'subname' => ' Lyft launching cross-platform service this week ',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
////            'img' => 'img',
//        ]);
//
//        $post_coment1 = PostComment::create([
//            'name' => '1',
//            'desc' => 'desc',
//            'img' => 'img',
//        ]);
//        $post_coment2 = PostComment::create([
//            'name' => 'name2',
//            'desc' => 'desc',
//            'img' => 'img',
//        ]);
//        $post_category1 = PostCategory::create([
//            'name' => 'cat1',
//            'desc' => 'desc',
//            'img' => 'img',
//        ]);
//
//        $post_tag1 = PostTag::create([
//            'name' => 'name1',
//            'desc' => 'desc',
//            'img' => 'img',
//        ]);
//        $post_tag2 = PostTag::create([
//            'name' => 'name2',
//            'desc' => 'desc',
//            'img' => 'img',
//        ]);
//
//        $post->user()->associate($user);
//        $post->category()->associate($post_category1);
//        $post->tags()->save($post_tag1);
//        $post->tags()->save($post_tag2);
//
//        $post->comments()->save($post_coment1);
//        $post->comments()->save($post_coment2);
////        $post->images()->save($post_img1);
//        $post->save();
//
//
//
//        $post_content4 = PostContent::create([
//            'num' => '1',
//            'name' => ' Lyft launching dsdsd',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content4_img = PostImage::create([
//            'name' => 'portfolio14.png',
//            'url' => 'portfolio14.png',
//            'desc' => 'img',
//        ]);
//        $post_content4_type = PostContentType::create([
//            'name' => 'card',
//            'desc' => 'desc',
//        ]);
//
//
//        $post_content_type4_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => '',
//        ]);
//        $post_content_type4_attr2 = PostContentTypeAttribute::create([
//            'name' => 'title_styles',
//            'value' => 'w-full text_font_marvel text-lg font-semibold  text-textPrimary',
//        ]);
//        $post_content_type4_attr3 = PostContentTypeAttribute::create([
//            'name' => 'title_label',
//            'value' => 'Lyft launching ',
//        ]);
//        $post_content_type4_attr4 = PostContentTypeAttribute::create([
//            'name' => 'desc_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content_type4_attr5 = PostContentTypeAttribute::create([
//            'name' => 'desc_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//        ]);
//        $post->contents()->save($post_content4);
//        $post_content4->images()->save($post_content4_img);
//        $post_content4->type()->associate($post_content4_type);
//        $post_content4_type->attributes()->save($post_content_type4_attr1);
//        $post_content4_type->attributes()->save($post_content_type4_attr2);
//        $post_content4_type->attributes()->save($post_content_type4_attr3);
//        $post_content4_type->attributes()->save($post_content_type4_attr4);
//        $post_content4_type->attributes()->save($post_content_type4_attr5);
//        $post_content4->save();
//        $post_content4_type->save();
//
//
//
//        //new workflow
//        $post_content8 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content8_type = PostContentType::create([
//            'name' => 'icon_header',
//            'desc' => 'desc',
//        ]);
//        $post_content8_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'bg-bgPrim -ml-5 -mb-8 -translate-y-3 relative h-10 w-10  rounded-full flex justify-center items-center',
//        ]);
//        $post_content8_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'icon_header_styles',
//            'value' => 'bg-bgPrim h-6 w-6 rounded-full flex justify-center items-center border-[3px] border-info text-info text-xs',
//        ]);
//        $post_content8_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'num',
//            'value' => '0',
//        ]);
//
//        $post_content8_img = PostImage::create([
//            'name' => 'portfolio4.png',
//            'url' => 'portfolio4.png',
//            'desc' => 'img',
//        ]);
//        $post_content8_img2 = PostImage::create([
//            'name' => 'portfolio14.png',
//            'url' => 'portfolio14.png',
//            'desc' => 'img',
//        ]);
//        $post_content8->images()->save($post_content8_img);
//        $post_content8->images()->save($post_content8_img2);
//
//        $post->contents()->save($post_content8);
//        $post_content8->type()->associate($post_content8_type);
//        $post_content8_type->attributes()->save($post_content8_type_attr1);
//        $post_content8_type->attributes()->save($post_content8_type_attr2);
//        $post_content8_type->attributes()->save($post_content8_type_attr3);
//        $post_content8->save();
//        $post_content8_type->save();
//
//        $post_content5 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content5_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content5_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'border-l-2 border-info bg-bgTern w-full flex flex-col gap-5 px-5 pt-5 rounded-sm',
//        ]);
//        $post_content5_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text_font_marvel text-lg font-semibold  text-textPrimary',
//        ]);
//        $post_content5_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => 'Lyft launching ',
//        ]);
//        $post->contents()->save($post_content5);
//        $post_content5->type()->associate($post_content5_type);
//        $post_content5_type->attributes()->save($post_content5_type_attr1);
//        $post_content5_type->attributes()->save($post_content5_type_attr2);
//        $post_content5_type->attributes()->save($post_content5_type_attr3);
//        $post_content5->save();
//        $post_content5_type->save();
//
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'border-l-2 border-info bg-bgTern w-full flex flex-col gap-5 p-5 rounded-sm mb-5',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//
//
//        $post_content7 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content7_type = PostContentType::create([
//            'name' => 'img',
//            'desc' => 'desc',
//        ]);
//        $post_content7_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'p-5 relative m-0 h-full w-full shrink-0 overflow-hidden rounded-sm rounded-r-none',
//        ]);
//        $post_content7_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'img_styles',
//            'value' => 'rounded-xl border-solid border-8 border-neutral-900 h-full w-full object-cover',
//        ]);
//        $post_content7_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'num',
//            'value' => '0',
//        ]);
//
//        $post_content7_img = PostImage::create([
//            'name' => 'portfolio4.png',
//            'url' => 'portfolio4.png',
//            'desc' => 'img',
//        ]);
//        $post_content7_img2 = PostImage::create([
//            'name' => 'portfolio14.png',
//            'url' => 'portfolio14.png',
//            'desc' => 'img',
//        ]);
//        $post_content7->images()->save($post_content7_img);
//        $post_content7->images()->save($post_content7_img2);
//
//        $post->contents()->save($post_content7);
//        $post_content7->type()->associate($post_content7_type);
//        $post_content7_type->attributes()->save($post_content7_type_attr1);
//        $post_content7_type->attributes()->save($post_content7_type_attr2);
//        $post_content7_type->attributes()->save($post_content7_type_attr3);
//        $post_content7->save();
//        $post_content7_type->save();
//
//
//        $post_content5 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content5_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content5_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => ' w-full flex flex-col gap-5 p-5 rounded-sm mt-5',
//        ]);
//        $post_content5_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text_font_marvel text-lg font-semibold  text-textPrimary',
//        ]);
//        $post_content5_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => 'Lyft launching ',
//        ]);
//        $post->contents()->save($post_content5);
//        $post_content5->type()->associate($post_content5_type);
//        $post_content5_type->attributes()->save($post_content5_type_attr1);
//        $post_content5_type->attributes()->save($post_content5_type_attr2);
//        $post_content5_type->attributes()->save($post_content5_type_attr3);
//        $post_content5->save();
//        $post_content5_type->save();
//
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-full flex flex-col gap-5 p-5 rounded-sm',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//
//
//
//
//
//        $post_content5 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content5_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content5_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-auto flex flex-col gap-5 p-5 pr-2 rounded-sm',
//        ]);
//        $post_content5_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text_font_marvel text-2xl font-semibold  text-warning',
//        ]);
//        $post_content5_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => '&',
//        ]);
//        $post->contents()->save($post_content5);
//        $post_content5->type()->associate($post_content5_type);
//        $post_content5_type->attributes()->save($post_content5_type_attr1);
//        $post_content5_type->attributes()->save($post_content5_type_attr2);
//        $post_content5_type->attributes()->save($post_content5_type_attr3);
//        $post_content5->save();
//        $post_content5_type->save();
//
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-auto flex flex-col gap-5 py-5 pr-5 rounded-sm',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text_font_marvel text-2xl font-semibold  text-warning',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => 'The Link',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-full flex flex-col gap-5 pb-5 px-5 rounded-sm',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-full flex flex-col gap-5 pb-5 px-5 rounded-sm',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'w-full flex flex-col gap-5 pb-5 px-5 rounded-sm',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//
//        $post_content8 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content8_type = PostContentType::create([
//            'name' => 'icon_header',
//            'desc' => 'desc',
//        ]);
//        $post_content8_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'bg-bgPrim -ml-8 -mb-8 -translate-y-3 relative h-10 w-10  rounded-full flex justify-center items-center',
//        ]);
//        $post_content8_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'icon_header_styles',
//            'value' => 'bg-bgPrim h-6 w-6 rounded-full flex justify-center items-center border-[3px] border-info text-info text-xs',
//        ]);
//        $post_content8_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'num',
//            'value' => '0',
//        ]);
//
//        $post_content8_img = PostImage::create([
//            'name' => 'portfolio4.png',
//            'url' => 'portfolio4.png',
//            'desc' => 'img',
//        ]);
//        $post_content8_img2 = PostImage::create([
//            'name' => 'portfolio14.png',
//            'url' => 'portfolio14.png',
//            'desc' => 'img',
//        ]);
//        $post_content8->images()->save($post_content8_img);
//        $post_content8->images()->save($post_content8_img2);
//
//        $post->contents()->save($post_content8);
//        $post_content8->type()->associate($post_content8_type);
//        $post_content8_type->attributes()->save($post_content8_type_attr1);
//        $post_content8_type->attributes()->save($post_content8_type_attr2);
//        $post_content8_type->attributes()->save($post_content8_type_attr3);
//        $post_content8->save();
//        $post_content8_type->save();
//
//        $post_content5 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content5_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content5_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'border-l-2 border-info bg-bgTern w-full flex flex-col gap-5 px-5 pt-5 rounded-sm',
//        ]);
//        $post_content5_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text_font_marvel text-lg font-semibold  text-textPrimary',
//        ]);
//        $post_content5_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => 'Lyft launching ',
//        ]);
//        $post->contents()->save($post_content5);
//        $post_content5->type()->associate($post_content5_type);
//        $post_content5_type->attributes()->save($post_content5_type_attr1);
//        $post_content5_type->attributes()->save($post_content5_type_attr2);
//        $post_content5_type->attributes()->save($post_content5_type_attr3);
//        $post_content5->save();
//        $post_content5_type->save();
//
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'text',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'styles',
//            'value' => 'border-l-2 border-info bg-bgTern w-full flex flex-col gap-5 p-5 rounded-sm mb-5',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'text_styles',
//            'value' => 'w-full text-base font-normal leading-relaxed  antialiased text-textPrimary',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'text_label',
//            'value' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona.  ',
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6->save();
//        $post_content6_type->save();
//
//
//
//        $post_content6 = PostContent::create([
//            'num' => '1',
//            'name' => ' testing2 dynamic components',
//            'desc' => ' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona. ',
//            'img' => 'img',
//        ]);
//        $post_content6_type = PostContentType::create([
//            'name' => 'codeplayground_v2',
//            'desc' => 'desc',
//        ]);
//        $post_content6_type_attr1 = PostContentTypeAttribute::create([
//            'name' => 'html',
//            'value' => '<p>Testing</p>',
//        ]);
//        $post_content6_type_attr2 = PostContentTypeAttribute::create([
//            'name' => 'css',
//            'value' => 'p{color:red}',
//        ]);
//        $post_content6_type_attr3 = PostContentTypeAttribute::create([
//            'name' => 'js',
//            'value' => "console.log('testing');",
//            ]);
//        $post_content6_type_attr4 = PostContentTypeAttribute::create([
//            'name' => 'height',
//            'value' => 'h-[300px]'
//        ]);
//        $post_content6_type_attr5 = PostContentTypeAttribute::create([
//            'name' => 'bg_color_1',
//            'value' => 'bg-[#151528]'
//        ]);
//        $post_content6_type_attr6 = PostContentTypeAttribute::create([
//            'name' => 'bg_color_2',
//            'value' => 'bg-[#2A2A50]'
//        ]);
//        $post_content6_type_attr7 = PostContentTypeAttribute::create([
//            'name' => 'text_color_1',
//            'value' => 'text-[#d8d6ff]'
//        ]);
//        $post_content6_type_attr8 = PostContentTypeAttribute::create([
//            'name' => 'text_color_2',
//            'value' => 'text-[#7e73a2]'
//        ]);
//        $post_content6_type_attr9 = PostContentTypeAttribute::create([
//            'name' => 'rounded',
//            'value' => 'rounded-lg'
//        ]);
//        $post->contents()->save($post_content6);
//        $post_content6->type()->associate($post_content6_type);
//        $post_content6_type->attributes()->save($post_content6_type_attr1);
//        $post_content6_type->attributes()->save($post_content6_type_attr2);
//        $post_content6_type->attributes()->save($post_content6_type_attr3);
//        $post_content6_type->attributes()->save($post_content6_type_attr4);
//        $post_content6_type->attributes()->save($post_content6_type_attr5);
//        $post_content6_type->attributes()->save($post_content6_type_attr6);
//        $post_content6_type->attributes()->save($post_content6_type_attr7);
//        $post_content6_type->attributes()->save($post_content6_type_attr8);
//        $post_content6_type->attributes()->save($post_content6_type_attr9);
//        $post_content6->save();
//        $post_content6_type->save();
        $this->call(ComponentsSeeder::class);
    }
}
