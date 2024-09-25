<?php

namespace App\Http\Controllers\blog\v1;
use App\Http\Controllers\Controller;
use App\Models\blog\Component\Component;
use App\Models\blog\Image;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostContent;
use App\Models\Client;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
class PostController extends Controller
{
//    protected $user;
    public function __construct(Request $request)
    {
//        $token = $request->header('Authorization');
//        if($token != '')
//            //En caso de que requiera autentifiación la ruta obtenemos el usuario y lo almacenamos en una variable, nosotros no lo utilizaremos.
//            $this->user = JWTAuth::parseToken()->authenticate();
    }
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        //Listamos todos los postos
        $posts = Post::with('category','comments','contents','user','client')->get();
        $postscat = PostCategory::get();
        return response()->json([
            'data' => $posts
        ], 200);
    }
    public function paginated(Request $request){
        $posts = Post::with('category','comments','contents','user','client','images')->paginate(5);
        return response()->json([
            'data' => $posts
        ], 200);
    }
    public function paginatedContent(Request $request, $id){
        //        $posts = Post::with('category','tags','comments','contents','user','client','images')->paginate(5);
        $data = Component::with('posts','type','subcomponents')
            ->whereHas('posts', function ($query) use ($id) {
                $query->where('post_id', $id);
            })
            ->paginate(5);
//        $data = $data->whereNull('post_content_id')->find($id);
        return response()->json([
            'data' => $data
        ], 200);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return JsonResponse
     */
    public function store(Request $request)
    {
        $data = $request->only('type','name', 'desc', 'price','stock','img', 'category', 'subcategory', 'supercategory');
        $validator = Validator::make($data, [
            'name' => 'required|max:50|string',
            'desc' => 'required|string',
//            'img' => 'required|file'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $post = Post::create([
            'name' => $request->name,
            'subname' => $request->subname,
            'desc' => $request->desc,
            'price' => $request->price,
        ]);
        $user = PostCategory::find($request->user);
        $category = PostCategory::find($request->category);
        $post->user()->associate($user);
        $post->category()->associate($category);
        $post->save();


        try {
            if ($request->hasFile('img')) {
                $uploadedImages = $request->img;
                foreach ($uploadedImages as $uploadedImage) {
                    $originalName = $uploadedImage->getClientOriginalName();
                    $path = $uploadedImage->storeAs('public/blog/posts/'.$post->id, $originalName);
                    $images[] = $path;
                    $post_img = Image::create([
                        'name' => $originalName,
                        'url' => $path,
                        'desc' => 'img',
                    ]);
                    $post->images()->save($post_img);
                    $post->save();
                }
            }
        } catch (FileException $e) {
        }

        return response()->json([
            'message' => 'post created',
            'data' => Post::with('category','comments','contents','user','client','images')->find($post->id),
        ], Response::HTTP_OK);
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\blog\Post  $post
     * @return JsonResponse
     */
    public function show($id)
    {
        //Bucamos el posto
        $post = Post::with(
            'components.type',
            'components.attributes',
            'components.images',
            'components.subcomponents',
            'user',
            'client')->find($id);
//        $post2 = $post->contents()->whereNull('post_content_id')->get();
        //$Post= Variation::with(['Post', 'Post.category', 'Post.subcategory', 'Post.supercategory', 'attributes'])->find($id);
        //Si el Posto no existe devolvemos error no encontrado
        if (!$post) {
            return response()->json([
                'message' => 'post not found.',
            ], 404);
        }
        //Si hay posto lo devolvemos
        return response()->json([
            'message' => 'post not found.',
            'data' => $post
        ], 200);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // Obtener los datos del formulario

        // Acceder a los datos individuales

        $data = $request->only('name', 'desc', 'img', 'category');

        $validator = Validator::make($data, [
            'name' => 'required|max:1000|string',
            'desc' => 'required|string',
//            'img' => 'required|max:50|string',
//            'category' => 'required|max:50|string',
        ]);
        //Si falla la validación
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $post = Post::with(['images'])->find($request->id);
        $post->name= $request->name;
        $post->subname= $request->subname;
        $post->desc= $request->desc;
//        $user = PostCategory::find($request->user);
        $category = PostCategory::find($request->category);
//        $post->user()->associate($user);
        $post->category()->associate($category);
        $images = $post->images;
        $post->save();
        try {
            if ($request->hasFile('img')) {
                $uploadedImages = $request->img;

                foreach ($images as $image) {

                    $image = Image::find($image->id);
                    if($image!==null){
                        $img = Image::where('name', $image->name)->get();
                        if($img!==null && Storage::exists('public/blog/posts/'.$post->id.'/'.$image->name)){
                            Storage::delete('public/blog/posts/'.$post->id.'/'.$image->name);
                            $image->delete();
                        }

                    }
                }
                foreach ($uploadedImages as $uploadedImage) {
                    $originalName = $uploadedImage->getClientOriginalName();
                    $img = Image::where('name', $originalName)->get();
                    if($img!==null){
                        $path = $uploadedImage->storeAs('public/blog/posts/'.$post->id, $originalName);
                        $post_img = Image::create([
                            'name' => $originalName,
                            'url' => $path,
                            'desc' => 'img',
                        ]);
                        $post->images()->save($post_img);
                        $post->save();
                    }

                }
            }
        } catch (FileException $e) {
        }
        if($request->category){
            $category = postCategory::find($request->category);
            $post->category()->associate($category);
        }
        $post->save();

        return response()->json([
            'message' => 'eeeeeee created',
            'data' => $post,
        ], Response::HTTP_OK);
        //Devolvemos los datos actualizados.
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\blog\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Buscamos el posto
        $post = Post::findOrfail($id);
        //Eliminamos el posto
        $post->delete();
        //Devolvemos la respuesta
        return response()->json([
            'message' => 'post deleted successfully'
        ], Response::HTTP_OK);
    }

    public function destroyContentRelation($postId, $contentId)
    {
        try {
            // Obtén el post y el contenido
            $post = Post::findOrFail($postId);
            $content = Component::findOrFail($contentId);

            // Elimina la relación
            $post->components()->detach($content->id);

            // Puedes devolver una respuesta JSON u otra salida según tus necesidades
            return response()->json(['message' => $content, 200]);
        } catch (\Exception $e) {
            // Manejar errores, por ejemplo, si no se encuentra el post o el contenido
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function addComponent($postId, $contentId)
    {
        try {
            // Obtén el post y el contenido
            $post = Post::findOrFail($postId);
            $component = Component::findOrFail($contentId);
            $post->components()->save($component);

            // Puedes devolver una respuesta JSON u otra salida según tus necesidades
            return response()->json([
                'message' => 'eeeeeee created',
                'data' => $post,
            ], Response::HTTP_OK);
        } catch (\Exception $e) {
            // Manejar errores, por ejemplo, si no se encuentra el post o el contenido
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function postFilters(Request $request)
    {
        //$filters = json_decode(json_encode(request()->searchFilters));
        $query = Variation::with(['post','post.category', 'post.subcategory', 'post.supercategory', 'attributes']);
        $filters = [
            'category' => request()->searchFilters[0]['category'],
            'subcategory' => request()->searchFilters[1]['subcategory'],
            'supercategory' => request()->searchFilters[2]['supercategory'],
            'colors' => request()->searchFilters[3]['colors'],
            'sizes' => request()->searchFilters[4]['sizes'],
            'attributes' => request()->searchFilters[5]['attributes'],
            'name' => request()->searchFilters[6]['name'],
            'sort' => request()->searchFilters[7]['sort']
        ];
        if (!empty($filters['name'])) {
            $query->whereHas('post', function ($q) use ($filters) {
                $q->where('name', 'like', '%'.$filters['name'].'%');            });
        }
        if (!empty($filters['category'])) {
            $query->whereHas('post', function ($q) use ($filters) {
                $q->where('category_id', $filters['category']);
            });
        }
        if (!empty($filters['subcategory'])) {
            $query->whereHas('post', function ($q) use ($filters) {
                $q->where('subcategory_id', $filters['subcategory']);
            });
        }
        if (!empty($filters['supercategory'])) {
            $query->whereHas('post', function ($q) use ($filters) {
                $q->where('supercategory_id', $filters['supercategory']);
            });
        }
        $attributes=[];
        foreach($filters['attributes'] as $value) {
            $attributes[] = $value['id'];
        }
        $filters['attributes']=$attributes;
        if (!empty($filters['attributes'])) {
            $variations = Variation::whereHas('attributes', function ($q) use ($attributes) {
                $q->whereIn('attribute_id', $attributes);
            })->get(['id'])->pluck('id');
            $query->whereIn('id', $variations);
        }

        $variationsByColorAndpostId = $query->get()->groupBy(['post_id', function ($variation) {
            return $variation->attributes->where('name', 'color')->first()->value;
        }]);

        $aux=[];
        foreach ($variationsByColorAndpostId as $prod){
            foreach ($prod as $key => $att){
                //$aux[]=$att[0];
                array_push($aux,$att[0]);
            }
        }
        if (!empty($filters['sort'])) {
            if(intval($filters['sort'])===1){
                usort($aux, function($a, $b) {
                    return $a->price <=> $b->price;
                });
            }else if(intval($filters['sort'])===2){
                usort($aux, function($a, $b) {
                    return $b->price <=> $a->price;
                });
            }

        }

        $currentPage = LengthAwarePaginator::resolveCurrentPage();
        $perPage = 4;
        $paginatedAux = new LengthAwarePaginator(
            array_slice($aux, ($currentPage - 1) * $perPage, $perPage, true),
            count($aux),
            $perPage,
            $currentPage
        );

        return response()->json([
            'message' => 'post created',
            'data' => [
                'post' =>$paginatedAux,
                'post_pg' =>$paginatedAux,
                'count($aux)' =>$aux,
                'count($currentPage)' =>$currentPage,
            ],
        ], Response::HTTP_OK);

    }
    /*d
     $variations = $query->get(['post_id'])->pluck('post_id');

            $posts_colors=[];
            $post = post::whereIn('id', $variations)->get();
            foreach ($post as $value) {
                $variations = Variation::with(['post', 'post.category', 'post.subcategory', 'post.supercategory', 'attributes'])
                    ->where('post_id', $value->id)
                    ->get();
                $variationsByColor = $variations->groupBy(function ($variation) {
                    return $variation->attributes->where('name', 'color')->first()->value;
                });
                foreach ($variationsByColor as $key => $value) {
                    $posts_colors[] = $variationsByColor[$key][0];
                }
            }

            return response()->json([
                'message' => 'post created',
                'data' => [
                    'post' =>$posts_colors,
                ],
            ], Response::HTTP_OK);
     */

}
