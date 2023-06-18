<?php

namespace App\Http\Controllers\blog\v1;
use App\Http\Controllers\Controller;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\PostContent;
use App\Models\blog\PostContentAttribute;
use App\Models\blog\PostContentType;
use App\Models\blog\PostImage;
use App\Models\Client;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
class PostContentController extends Controller
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
        $data = PostContent::with('post','subcontents', 'type.attributes', 'attributes')->get();
        return response()->json([
            'data' => $data
        ], 200);
    }
    public function getTypes(): JsonResponse
    {
        //Listamos todos los postos
        $postContentType = PostContentType::with('attributes')->get();
        return response()->json([
            'data' => $postContentType
        ], 200);
    }
    public function paginated(Request $request){
        $posts = PostContent::with('category','tags','comments','contents','user','client')->paginate(5);
        return response()->json([
            'data' => $posts
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

        $data = $request->only('post','num','name','type','desc');
        $validator = Validator::make($data, [
            'num' => 'required|max:50|string',
            'name' => 'required|max:50|string',
            'desc' => 'required|max:50|string',
//            'img' => 'required|file'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $post_content = PostContent::create([
            'num' => $request->num,
            'name' => $request->name,
            'desc' => $request->desc,
        ]);
        $post = Post::find($request->post);
        $post_content->post()->associate($post);
        $post_content->save();
        $type = PostContentType::get()->find($request->type);

//        $post->user()->associate($user);
        $post_content->type()->associate($type);
        $post_content->save();

        try {
            if ($request->hasFile('img')) {
                $uploadedImages = $request->img;
                foreach ($uploadedImages as $uploadedImage) {
                    $originalName = $uploadedImage->getClientOriginalName();
                    $path = $uploadedImage->storeAs('public/blog/posts/'.$post->id.'/'.$post_content->id.'/', $originalName);
                    $images[] = $path;
                    $post_img = PostImage::create([
                        'name' => $originalName,
                        'url' => $path,
                        'desc' => 'img',
                    ]);
                    $post_content->images()->save($post_img);
                    $post_content->save();
                }
            }
        } catch (FileException $e) {
        }

        return response()->json([
            'message' => 'post created',
            'data' => PostContent::with('post')->find($post_content->id),
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
        $post = PostContent::with('attributes')->find($id);;
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
     * @return JsonResponse
     */
    public function update(Request $request, $id)
    {
        // Obtener los datos del formulario

        // Acceder a los datos individuales
//        return response()->json(['error' => $request->all()], 400);

        $data = $request->only('name', 'desc');
        $validator = Validator::make($data, [
            'name' => 'required|max:10000|string',
            'desc' => 'required|max:10000|string',
//            'img' => 'required|max:50|string',
        ]);
        //Si falla la validación
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $post_content = PostContent::with(['subcontents','type.attributes','attributes'])->find($request->id);
        $post_content->name= $request->name;
        $post_content->desc= $request->desc;
        $type = PostContentType::with(['attributes'])->find($request->type);
        $post_content->type()->associate($type);

        foreach ($type->attributes as $attribute) {
            if ($request->has($attribute->name)) {
                // El parámetro con el nombre del atributo existe en la solicitud
                // Realiza las acciones que deseas realizar
                if($request->get($attribute->name)!==$attribute->value || $request->get($attribute->name)!==''){
                    $attr = $post_content->attributes()->where('name', $attribute->name)->first();
                    if ($attr) {
                        $attr->value = $request->get($attribute->name);
                        $attr->save();
                    }else{
                        $content_attr = PostContentAttribute::create([
                            'name' => $attribute->name,
                            'value' => $request->get($attribute->name),
                        ]);
                        $post_content->attributes()->save($content_attr);
                        $post_content->save();
                    }
                }else{
                    $post_content->attributes()->where('name', $attribute->name)->delete();
                    $post_content->save();
                }

            }
        }
//        $post_content->subcontents()->detach();
        $post_content->subcontents()->update(['post_content_id' => null]);
        foreach ($request->all() as $key => $value) {
            if (Str::startsWith($key,'subcontent_')) {
                $data = PostContent::with('subcontents')->find($value);
                $post_content->subcontents()->save($data);
            }
        }
//        try {
//            if ($request->hasFile('img')) {
//                $uploadedImages = $request->img;
//
//                foreach ($images as $image) {
//
//                    $image = PostImage::find($image->id);
//                    if($image!==null){
//                        $img = PostImage::where('name', $image->name)->get();
//                        if($img!==null && Storage::exists('public/blog/posts/'.$post->id.'/'.$image->name)){
//                            Storage::delete('public/blog/posts/'.$post->id.'/'.$image->name);
//                            $image->delete();
//                        }
//
//                    }
//                }
//                foreach ($uploadedImages as $uploadedImage) {
//                    $originalName = $uploadedImage->getClientOriginalName();
//                    $img = PostImage::where('name', $originalName)->get();
//                    if($img!==null){
//                        $path = $uploadedImage->storeAs('public/blog/posts/'.$post->id, $originalName);
//                        $post_img = PostImage::create([
//                            'name' => $originalName,
//                            'url' => $path,
//                            'desc' => 'img',
//                        ]);
//                        $post->images()->save($post_img);
//                        $post->save();
//                    }
//
//                }
//            }
//        } catch (FileException $e) {
//        }


        return response()->json([
            'message' => 'eeeeeee created',
            'data' => $data,
        ], Response::HTTP_OK);
        //Devolvemos los datos actualizados.
    }
    function copyContentWithRelations($content)
    {
        $copy = $content->replicate();
        $copy->push();
        foreach ($content->getRelations() as $relation => $entries) {
            foreach ($entries as $entry) {
                $subcopy = $this->copyContentWithRelations($entry);
                $copy->{$relation}()->save($subcopy);
            }
        }
        $content->delete();
        return $copy;
    }
    public function getSubcontentWithComponents($subcontentId)
    {
        $subcontent = PostContent::with('post', 'subcontents', 'type.attributes', 'attributes')->find($subcontentId);

        if ($subcontent && $subcontent->subcontents) {
            foreach ($subcontent->subcontents as $sub) {
                $sub->subcontent_components = $this->getSubcontentWithComponents($sub->id);
            }
            return response()->json([
                'message' => 'eeeeesdsdsdee created',
            ], Response::HTTP_OK);
        }

//        return $subcontent;
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
        $post = PostContent::findOrfail($id);
        //Eliminamos el posto
        $post->delete();
        //Devolvemos la respuesta
        return response()->json([
            'message' => 'post deleted successfully'
        ], Response::HTTP_OK);
    }
    /*d
     $variations = $query->get(['post_id'])->pluck('post_id');

            $posts_colors=[];
            $post = PostContent::whereIn('id', $variations)->get();
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
    public function paginatedContent($id)
    {
        $posts = PostContent::with('post')->paginate(5);
        return response()->json([
            'data' => $posts
        ], 200);
    }


}
