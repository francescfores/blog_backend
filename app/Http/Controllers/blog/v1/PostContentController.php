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
        $data = PostContent::with('post','parents','subcontents', 'type.attributes', 'attributes')->get();
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
        $data = PostContent::with('post','subcontents', 'type.attributes', 'attributes')
            ->paginate(5);
        return response()->json([
            'data' => $data
        ], 200);
    }

    // Función recursiva para replicar subcomponentes
    function replicarSubcomponentes($originalComponente, $newParentComponente) {
        foreach ($originalComponente->subcontents as $originalSubcomponente) {
            // Crea una copia del subcomponente original
            $newSubcomponente = $originalSubcomponente->replicate();

            // Guarda el nuevo subcomponente asociado al nuevo componente
            $newParentComponente->subcontents()->save($newSubcomponente);
            foreach ($newParentComponente->attributes as $attribute) {
                // Clonar el atributo y asociarlo al nuevo objeto
                $newAttribute = $attribute->replicate();
                $newParentComponente->attributes()->save($newAttribute);
            }
            // Llama recursivamente para replicar subcomponentes de manera anidada
            $this->replicarSubcomponentes($originalSubcomponente, $newSubcomponente);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return JsonResponse
     */
    public function store(Request $request)
    {

        $data = $request->only('post','num','name','type','desc','recycled_id','copied_id','global');
        $validator = Validator::make($data, [
            'num' => 'required|max:50|string',
            'name' => 'required|string',
            'desc' => 'required|string',
            'type' => 'required|string',
//            'img' => 'required|file'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $post = Post::find($request->post);
       // return response()->json(['error' => [$post->id,$request->recycled_id,$request->copied_id]], 400);

        if($request->recycled_id !=null){
            $originalComponent = PostContent::with(['subcontents', 'type.attributes', 'attributes', 'subcontentsparents'])->find($request->recycled_id);
            $component = $originalComponent->replicate();
            $component->global = filter_var($request->global, FILTER_VALIDATE_BOOLEAN);

            $component->type()->associate($originalComponent->type);
            $component->save();

            $this->addAttrToChild($originalComponent,$component);

            $component->save();
            foreach ($originalComponent->subcontents  as $originalSubcomponent) {

                $component->subcontents()->save($originalSubcomponent);
                $component->save();
                //$this->copySubcontents($originalSubcomponent, null);  // El segundo parámetro es el parent_subcontent_id
            }
            $component->post()->associate($post);
            $component->save();

        }
        else if($request->copied_id){
            // Obtén el contenido original con sus relaciones cargadas
            //$originalComponent = PostContent::with(['subcontents', 'type.attributes', 'attributes', 'subcontentsparents'])->find($request->copied_id);
            $originalComponente = PostContent::with(['subcontents', 'type.attributes', 'attributes', 'subcontentsparents'])->find($request->copied_id);

            // Crea una copia del componente original
            $component = $originalComponente->replicate();
            $component->global=false;
            $component->post()->associate($post);
            $component->copied_id=$request->copied_id;
            // Guarda la nueva copia del componente
            $component->save();
            // Copiar todos los atributos relacionados del original al nuevo
            $this->addAttrToChild($originalComponente,$component);

            // Replicar subcomponentes de manera recursiva
            $this->replicarSubcomponentes($originalComponente, $component);
           /*
            return response()->json([
                'message' => 'post c',
                'data' => $component,
            ], Response::HTTP_OK);
           */
        }
        else{
            $component = PostContent::create([
                'num' => $request->num,
                'name' => $request->name,
                'desc' => $request->desc,
                'global' => filter_var($request->global, FILTER_VALIDATE_BOOLEAN),
            ]);

            $component->post()->associate($post);
            $component->save();
            $type = PostContentType::get()->find($request->type);

//        $post->user()->associate($user);
            $component->type()->associate($type);
            $component->save();

            try {
                if ($request->hasFile('img')) {
                    $uploadedImages = $request->img;
                    foreach ($uploadedImages as $uploadedImage) {
                        $originalName = $uploadedImage->getClientOriginalName();
                        //if($post){
                            //$path = $uploadedImage->storeAs('public/blog/posts/'.$post->id.'/'.$component->id.'/', $originalName);
                        //}else{
                            $path = $uploadedImage->storeAs('public/blog/components/'.$component->id.'/', $originalName);
                        //}
                        $images[] = $path;
                        $post_img = PostImage::create([
                            'name' => $originalName,
                            'url' => $path,
                            'desc' => 'img',
                        ]);
                        $component->images()->save($post_img);
                        $component->save();
                    }
                }
            } catch (FileException $e) {
            }

        }


        return response()->json([
            'message' => 'post createdddddd',
            'data' => PostContent::with(['subcontents', 'type.attributes', 'attributes', 'subcontentsparents'])->find($component->id),
        ], Response::HTTP_OK);
    }

    public function addAttrToChild($parent, $child){
        // Copiar todos los atributos relacionados del original al nuevo
        foreach ($parent->attributes as $attribute) {
            // Clonar el atributo y asociarlo al nuevo objeto
            $newAttribute = $attribute->replicate();
            $child->attributes()->save($newAttribute);
            $child->save();
        }
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
        $post = PostContent::with(['parents','post','images','subcontents','type.attributes','attributes'])->find($id);;
        //Si el Posto no existe devolvemos error no encontrado
        if (!$post) {
            return response()->json([
                'message' => 'content not found.',
            ], 404);
        }
        //Si hay posto lo devolvemos
        return response()->json([
            'message' => 'show',
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
        $data = $request->only('post','num','name','type','desc','recycled_id','copied_id','global');
        $validator = Validator::make($data, [
            'name' => 'required|max:100000|string',
            'desc' => 'required|max:100000|string',
//            'img' => 'required|max:50|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $component = PostContent::with(['subcontents','type.attributes','attributes'])->find($request->id);
        $component->name= $request->name;
        $component->desc= $request->desc;
        $component->global=  filter_var($request->global, FILTER_VALIDATE_BOOLEAN);
        $type = PostContentType::with(['attributes'])->find($request->type);
        //$component->type()->associate($type);
        foreach ($type->attributes as $attribute) {
            if ($request->has($attribute->name)) {
                // El parámetro con el nombre del atributo existe en la solicitud
                // Realiza las acciones que deseas realizar
                if($request->get($attribute->name)!==$attribute->value || $request->get($attribute->name)!==''){
                    $attr = $component->attributes()->where('name', $attribute->name)->first();
                    if ($attr) {
                        $attr->value = $request->get($attribute->name);
                        $attr->save();
                    }else{
                        $content_attr = PostContentAttribute::create([
                            'name' => $attribute->name,
                            'value' => $request->get($attribute->name),
                        ]);
                        $component->attributes()->save($content_attr);
                        $component->save();
                    }
                }else{
                    $component->attributes()->where('name', $attribute->name)->delete();
                    $component->save();
                }

            }
        }
        foreach ($request->all() as $key => $value) {
            if (Str::startsWith($key,'subcontent_')) {
               // if($component->subcontentsparents()->find($value)==null && $id !== $value && $value!='null'){
                    $data  = PostContent::with(['subcontents','type.attributes','attributes'])->find($value);

                    $newComponente = $data->replicate();
                    $newComponente->global = false;
                    $newComponente->save();
                    $this->replicarSubcomponentes($data, $newComponente);
                    $component->subcontents()->save($newComponente);

              //  }

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
        $component->save();
        $component = PostContent::with(['subcontents','type.attributes','attributes','subcontentsparents'])->find($component->id);


        return response()->json([
            'message' => 'eeeeeee created',
            'data' => $component,
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
        if ($post->global == 0) {
            // Elimina el PostContent
            $post->delete();
            return response()->json([
                'message' => 'post deleted successfully'
            ], Response::HTTP_OK);
        } else {
            return response()->json([
                'message' => 'post not deleted '
            ], Response::HTTP_OK);
        }
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
