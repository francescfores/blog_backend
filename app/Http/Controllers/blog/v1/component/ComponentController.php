<?php

namespace App\Http\Controllers\blog\v1\component;
use App\Http\Controllers\Controller;
use App\Models\blog\Component\Component;
use App\Models\blog\Component\Subcomponent;
use App\Models\blog\Component\SubcomponentAttribute;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\blog\Component\ComponentAttribute;
use App\Models\blog\Component\ComponentType;
use App\Models\blog\Image;
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
class ComponentController extends Controller
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
        $data = Component::with('posts','images','parents','subcomponents.subcomponent_attributes', 'type', 'attributes')->get();
        return response()->json([
            'data' => $data
        ], 200);
    }
    public function getTypes(): JsonResponse
    {
        //Listamos todos los postos
        $ComponentType = ComponentType::with('components')->get();
        return response()->json([
            'data' => $ComponentType
        ], 200);
    }
    public function paginated(Request $request){
        $data = Component::with('posts','images','parents','subcomponents.subcomponent_attributes', 'type', 'attributes')
            ->paginate(5);
        return response()->json([
            'data' => $data
        ], 200);
    }

    public function filter(Request $request){
        $data = Component::with('posts','images','parents','subcomponents.subcomponent_attributes', 'type', 'attributes')
            ->paginate(5);
        $data = $request->all();

        $columns = $data['filter']['columns'];
        $page = $data['filter']['current_page'];

        // Inicia la consulta con el modelo
        $query = Component::query()->with(['posts','subcomponents.subcomponent_attributes', 'type', 'attributes']);

        // Aplica orden y filtrado para cada columna
        foreach ($columns as $column) {
            if ($column['order']) {
                // Si la columna es 'type', realiza el orden considerando la relación
                if ($column['column_name'] === 'type') {
                    /*
                     * Se utiliza la función leftJoin para unir la tabla component_type
                     * en caso de que estés ordenando por la columna 'type'. Luego, se utiliza orderBy para aplicar la ordenación.
                     */
                    $query->leftJoin('component_type', 'component.component_type_id', '=', 'component_type.id')
                        ->orderBy('component_type.name', $column['order']);
                } else {
                    // Si no es 'type', realiza el orden directamente en la tabla actual
                    $query->orderBy($column['column_name'], $column['order']);
                }
            }
            if ($column['value'] !== null) {
                // Si la columna es 'type', realiza el filtrado considerando la relación
                if ($column['column_name'] === 'type') {
                    $query->whereHas('type', function ($subquery) use ($column) {
                        $subquery->where('name', 'LIKE', "%{$column['value']}%");
                    });
                } else {
                    // Si no es 'type', realiza el filtrado directamente en la tabla actual
                    $query->where($column['column_name'], 'LIKE', "%{$column['value']}%");
                }
            }
        }

        // Pagina el resultado
        $perPage = 5; // Cantidad de resultados por página, ajusta según tus necesidades
        $data = $query->paginate($perPage, ['*'], 'page', $page);

        return response()->json([
            'data' => $data
        ], 200);
    }

    // Función recursiva para replicar subcomponentes
    function replicateComponent($component) {
        $component = $component->replicate();
        $component->save();
        foreach ($component->attributes as $attribute) {
            $newAttribute = $attribute->replicate();
            $component->attributes()->save($newAttribute);
        }
        foreach ($component->subcomponents as $subMain) {

            $subNew = Subcomponent::create([
                'component_child_id' => $subMain->component->id,
                'component_parent_id' => $component->id,
            ]);

            $this->replicateSubComponent($subMain,$subNew);
        }
        $component->save();
        return $component;
    }
    function replicateSubComponent($subMain,$subNew) {
        //listamos y copiamos todos sus atts al nuevo comp
        //if($component && $component->component){

        foreach ($subMain->subcomponents as $subMain2) {

            $subNew2 = Subcomponent::create([
                'component_child_id' => $subMain2->component->id,
                'subcomponent_id' => $subNew->id,
            ]);
            $subNew->subcomponents()->save($subNew2);
            foreach ($subMain2->subcomponent_attributes as $attribute) {
                $newAttribute = $attribute->replicate();
                $subNew2->subcomponent_attributes()->save($newAttribute);
                $subNew2->save();
            }
            $this->replicateSubComponent($subMain2,$subNew2);
        }

        //}

    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return JsonResponse
     */
    public function store(Request $request)
    {
        //tipos de store
        //crear compoente normal
        //crear un componente i agregarlo al post
        //copiar componente
        $data = $request->only('post','name','type','desc','copied_id','copy_childs');
        $validator = Validator::make($data, [
            'name' => 'required|string',
            'desc' => 'required|string',
            'type' => 'required|string',
//            'img' => 'required|file'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        if($request->copied_id && $request->copied_id!='undefined'){
              if($request->copy_childs && $request->copy_childs!='undefined'){
                  $originalComponente = Component::with(['posts','subcomponents.subcomponent_attributes', 'type', 'attributes'])->find($request->copied_id);
                  $component= $this->replicateComponent($originalComponente);
              }else{
                  $originalComponent = Component::with(['posts','subcomponents.subcomponent_attributes', 'type', 'attributes'])->find($request->copied_id);
                  $component = $originalComponent->replicate();
                  $component->type()->associate($originalComponent->type);
                  $component->save();
                  $this->addAttrToChild($originalComponent,$component);
              }
        }else{
            $component = Component::create([
                'name' => $request->name,
                'desc' => $request->desc,
                'global' => filter_var($request->global, FILTER_VALIDATE_BOOLEAN),
            ]);
            //$component->post()->associate($post);
            //$component->save();
            $type = ComponentType::get()->find($request->type);
            //$post->user()->associate($user);
            $component->type()->associate($type);
            $component->save();


        }
        // return response()->json(['error' => [$post->id,$request->recycled_id,$request->copied_id]], 400);

        try {
            if ($request->hasFile('img')) {
                $uploadedImages = $request->img;
                foreach ($uploadedImages as $uploadedImage) {
                    $originalName = $uploadedImage->getClientOriginalName();
                    //if($post){
                    //$path = $uploadedImage->storeAs('public/blog/posts/'.$post->id.'/'.$component->id.'/', $originalName);
                    //}else{
                    $path = $uploadedImage->storeAs('public/blog/components/', $originalName);
                    //}
                    $images[] = $path;
                    $post_img = Image::create([
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

        if ($request->post!='undefined'){
            $post = Post::with(['components'])->find($request->post);
            $post->components()->save($component);
            $post->save();
        }
        return response()->json([
            'message' => 'post createdddddd',
            'data' => $component,
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
        $post = Component::with(['parents','posts','images','subcomponents.subcomponent_attributes','type','attributes'])->find($id);;
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
        
        $data = $request->only('post','num','name','type','desc','recycled_id','copied_id','global','subcomponent_id');
        $validator = Validator::make($data, [
            'name' => 'required|max:100000|string',
            'desc' => 'required|max:100000|string',
//            'img' => 'required|max:50|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $subcomponent=null;
        if($request->subcomponent_id!='undefined'){
            $component = Component::whereHas('parents', function ($query) use ($request) {
                $query->where('id', $request->subcomponent_id);
            })
                ->with(['subcomponents.subcomponent_attributes', 'type', 'attributes'])
                ->first();
            $subcomponent = Subcomponent::with(['component','subcomponent_attributes'])
                ->find($request->subcomponent_id);
        }else{
            $component = Component::with(['subcomponents.subcomponent_attributes', 'type', 'attributes'])
                ->find($request->id);
        }
        $component->name= $request->name;
        $component->desc= $request->desc;
        //$component->global=  filter_var($request->global, FILTER_VALIDATE_BOOLEAN);
        $type = ComponentType::find($request->type);
        //$component->type()->associate($type);
        foreach ($component->attributes as $attribute) {

            $key ='default_attrs_';
            if ($request->has($key.''.$attribute->name)) {
                $attr = $component->attributes()->where('name', $attribute->name)->first();
                $attr->value=$request->get($key.''.$attribute->name);
                $attr->save();
                //if($request->get($attribute->name)!==$attribute->value || $request->get($attribute->name)!==''){
            }
            //si es un subcomponent editamos los attrs del subcomponent
            $key ='subcomponent_attributes_';

            if ($subcomponent && $request->has($key.''.$attribute->name)) {

                // si ay un atributo del subcomponete que modificar
                $attr = $subcomponent->subcomponent_attributes()->where('name', $attribute->name)->first();
                //comprobamos que si el valor pasado del att es null y existe la relacion la borramos
                if($attr && $request->get($key.''.$attribute->name)==null){
                    $attr->delete();

                    //return response()->json([
                    //    'message' => 'comprobamos que si el valor pasado del att es null y existe la relacion la borramos',
                    //], Response::HTTP_OK);
                }
                //sino es nullo y el atributo del subcomponete no existe lo creamos
                elseif (!$attr && $request->get($key.''.$attribute->name)!=null){
                    $attribute = SubcomponentAttribute::create([
                        'name' => $attribute->name,
                        'value' => $request->get($key.''.$attribute->name),
                    ]);
                    $attribute->save();
                    $subcomponent->subcomponent_attributes()->save($attribute);
                    $subcomponent->save();
                    //return response()->json([
                    //    'message' => 'sino es nullo y el atributo del subcomponete no existe lo creamos',
                    //], Response::HTTP_OK);
                }
                //sino lo modificamos
                else if($attr && $request->get($key.''.$attribute->name)!=null){
                    $attr->value = $request->get($key.''.$attribute->name);
                    $attr->save();
                    //return response()->json([
                    //    'message' => 'sino lo modificamos',
                    //], Response::HTTP_OK);
                }
            }
        }

        foreach ($request->all() as $key => $value) {
            if (Str::startsWith($key,'subcontent_')) {
//                if( $id !== $value && $value!='null'){
                if($value!='null'){
                    $originalComponente = Component::with(['subcomponents.subcomponent_attributes', 'type', 'attributes'])->find($value);
                    //si queremos que solo a fecte al componente padre i no donde se utilice por 
                    //ejemplo en un grid en una pagina solo afecta al grid i no en esa pagina donde se usa el
                    if($subcomponent){
                        $originalSubComponente = Subcomponent::with(['subcomponents.subcomponent_attributes'])->find($subcomponent->id);
                        $componente = Component::with(['subcomponents.subcomponent_attributes'])->find($value);
                        $subNew = Subcomponent::create([
                            'component_child_id' => $value,
                            'subcomponent_id' => $subcomponent->id,
                            'order' => count($originalSubComponente->subcomponents)+1,
                        ]);
                        $originalSubComponente->subcomponents()->save($subNew);

                        foreach ($componente->subcomponents as $subMain) {
                            $subNew2 = Subcomponent::create([
                                'component_child_id' => $subMain->component->id,
                                'subcomponent_id' => $subNew->id,
                                'order' => count($originalSubComponente->subcomponents)+1,
                            ]);
                            $subNew->subcomponents()->save($subNew2);

                            foreach ($subMain->subcomponent_attributes as $attribute) {
                                $newAttribute = $attribute->replicate();
                                $subNew2->subcomponent_attributes()->save($newAttribute);
                                $subNew2->save();
                            }

                            $this->replicateSubComponent($subMain,$subNew2);
                        }
                    }else{
                        /* $component = Component::whereHas('posts', function ($query) use ($request) {
                           $query->where('id', 1);
                       })
                           ->with(['subcomponents.subcomponent_attributes', 'type', 'attributes'])
                           ->first(); */
                     /*  dd(Subcomponent::with(['parent','component'])->where('component_child_id', $id)->first())
                      dd(Subcomponent::with(['parent','component'])->get()); 
*/
                      $subNew2 =Subcomponent::with(['subcomponents.parent'])->where('component_child_id', $id)->get();
                       if(false){
                           foreach ($subNew2 as $subNew) {
                               $subcomponent=$subNew;
                               $originalSubComponente = Subcomponent::with(['subcomponents.subcomponent_attributes'])->find($subcomponent->id);
                               $componente = Component::with(['subcomponents.subcomponent_attributes'])->find($value);
                               $subNew = Subcomponent::create([
                                   'component_child_id' => $value,
                                   'subcomponent_id' => $subcomponent->id,
                                   'order' => count($originalSubComponente->subcomponents)+1,
                               ]);
                               $originalSubComponente->subcomponents()->save($subNew);

                               foreach ($componente->subcomponents as $subMain) {
                                   $subNew2 = Subcomponent::create([
                                       'component_child_id' => $subMain->component->id,
                                       'subcomponent_id' => $subNew->id,
                                       'order' => count($originalSubComponente->subcomponents)+1,
                                   ]);
                                   $subNew->subcomponents()->save($subNew2);

                                   foreach ($subMain->subcomponent_attributes as $attribute) {
                                       $newAttribute = $attribute->replicate();
                                       $subNew2->subcomponent_attributes()->save($newAttribute);
                                       $subNew2->save();
                                   }

                                   $this->replicateSubComponent($subMain,$subNew2);
                               }

                               $subNew = Subcomponent::create([
                                   'component_child_id' => $originalComponente->id,
                                   'component_parent_id' => $component->id,
                                   'order' => count($originalComponente->subcomponents)+1,
                               ]); 
                               $subNew->save();
                               $this->replicateSubComponent($originalComponente,$subNew);
                               $subNew->save(); 
                           }
                           
                       }else{
                       
                            $subNew = Subcomponent::create([
                               'component_child_id' => $originalComponente->id,
                               'component_parent_id' => $component->id,
                               'order' => count($originalComponente->subcomponents)+1,
                           ]); 
                           $subNew->save();
                           $this->replicateSubComponent($originalComponente,$subNew);
                           $subNew->save();  
                       }

                   }
                    // Crea una copia del componente original
                    //$component->copied_id=$request->copied_id;
                    // Guarda la nueva copia del componente
                    // Copiar todos los atributos relacionados del original al nuevo
                    // Replicar subcomponentes de manera recursiva
                    // Replicar subcomponentes de manera recursiva


                }

            }
        }
        try {
            if ($request->hasFile('img')) {
                $uploadedImages = $request->img;
                foreach ($uploadedImages as $uploadedImage) {
                    $originalName = $uploadedImage->getClientOriginalName();
                    $img = Image::where('name', $originalName)->get();
                    if($img!==null){
                    //if($post){
                    //$path = $uploadedImage->storeAs('public/blog/posts/'.$post->id.'/'.$component->id.'/', $originalName);
                    //}else{
                    $path = $uploadedImage->storeAs('public/blog/components/', $originalName);
                    //}
                    $images[] = $path;
                    $post_img = Image::create([
                        'name' => $originalName,
                        'url' => $path,
                        'desc' => 'img',
                    ]);
                    $component->images()->save($post_img);
                    $component->save();
                    }
                }
            }
        } catch (FileException $e) {
        }
        $component->save();
        return response()->json([
            'message' => 'created',
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
        $subcontent = Component::with('post', 'subcomponents.subcomponent_attributes', 'type.attributes', 'attributes')->find($subcontentId);

        if ($subcontent && $subcontent->subcomponents) {
            foreach ($subcontent->subcomponents as $sub) {
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
        $post = Component::findOrfail($id);
        if ($post->global == 0) {
            // Elimina el Component
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
    public function destroySubcomponent($id)
    {
        //Buscamos el posto
        $post = Subcomponent::findOrfail($id);
        foreach ($post->subcomponents as $subMain2) {
            $this->deleteSubComponent($subMain2);
            $subMain2->delete();
        }
        $post->delete();
            // Elimina el Component
            return response()->json([
                'message' => 'post deleted successfully'
            ], Response::HTTP_OK);
    }
    function deleteSubComponent($subMain) {
        //listamos y copiamos todos sus atts al nuevo comp
        //if($component && $component->component){

        foreach ($subMain->subcomponents as $subMain2) {
            $this->deleteSubComponent($subMain2);
            $subMain2->delete();
        }
    }
    public function paginatedContent($id)
    {
        $posts = Component::with('post')->paginate(5);
        return response()->json([
            'data' => $posts
        ], 200);
    }
    public function reorder(Request $request, $parentComponentId)
    {
        // Validación de la solicitud
        $request->validate([
            'newOrder' => 'required|array',
            'newOrder.*.subcomponentId' => 'required|integer',
            'newOrder.*.order' => 'required|integer',
        ]);

        // Lógica para reordenar los subcomponentes
        $newOrder = $request->input('newOrder');

        foreach ($newOrder as $item) {
            $subcomponentId = $item['subcomponentId'];
            $order = $item['order'];
            // Actualiza el orden en la base de datos según tus modelos y relaciones
            // Aquí asumimos que tienes un modelo llamado Component y una relación llamada subcomponents
            $subcomponent = Subcomponent::find($subcomponentId);
            $subcomponent->order = $order;
            $subcomponent->save();
        }
        $component = Component::with(['posts','subcomponents.subcomponent_attributes', 'type', 'attributes'])->find($request->input('parent_id'));
        return response()->json(['message' => 'Reordenación exitosa', 'data'=>$component], 200);
    }

}
