<?php

namespace App\Http\Controllers\blog\v1;
use App\Http\Controllers\Controller;
use App\Models\blog\PostCategory;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class PostCategoryController extends Controller
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
    public function index()
    {
        //Listamos todos los productos
        $category = PostCategory::get();
        return response()->json([
            'data' => [
                'category' => $category,
            ]
        ], 200);
    }
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function paginated(Request $request){
        $categories = PostCategory::paginate(1);
        return response()->json([
            'categories' => $categories
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
        //Validamos los datos
        $data = $request->only('name', 'desc', 'img');
        $validator = Validator::make($data, [
            'name' => 'required|max:50|string',
            'desc' => 'required|max:50|string',
            'img' => 'required|file'
        ]);
        //Si falla la validación
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        try {
            $img = $request->files->get('img');
            $filename = pathinfo($img->getClientOriginalName(), PATHINFO_FILENAME);
            $newFilename = $filename.'-'.uniqid().'.'.$img->guessExtension();
            $newFilename =str_replace(' ', '', $newFilename);
            $path = $request->file('img')->storeAs(
                'public/images', $newFilename
            );
        } catch (FileException $e) {
        }
        //Creamos el producto en la BD
        $product = PostCategory::create([
            'name' => $request->name,
            'desc' => $request->desc,
            'img' => $newFilename,
        ]);
        //Respuesta en caso de que todo vaya bien.
        return response()->json([
            'message' => 'PostCategory created',
            'data' => $product
        ], Response::HTTP_OK);
    }
    /**
     * Display the specified resource.
     *
     * @param PostCategory $product
     * @return JsonResponse
     */
    public function show($id)
    {
        //Bucamos el producto
        $product = PostCategory::find($id);

        //Si el producto no existe devolvemos error no encontrado
        if (!$product) {
            return response()->json([
                'message' => 'PostCategory not found.'
            ], 404);
        }
        //Si hay producto lo devolvemos
        return response()->json([
            'message' => 'Product updated successfully',
            'data' => $product
        ], Response::HTTP_OK);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ecommerce\PostCategory  $product
     * @return JsonResponse
     */
    public function update(Request $request, $id)
    {

        //Validación de datos
        $data = $request->only('name', 'desc');
        $validator = Validator::make($data, [
            'name' => 'required|max:50|string',
            'desc' => 'required|max:50|string',
        ]);
        //Si falla la validación error.
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        //Buscamos el producto
        $product = PostCategory::findOrfail($id);
        //Actualizamos el producto.
        $product->update([
            'name' => $request->name,
            'desc' => $request->desc,
        ]);
        //Devolvemos los datos actualizados.
        return response()->json([
            'message' => 'Product updated successfully',
            'data' => $product
        ], Response::HTTP_OK);
    }

    public function updateImage(Request $request, $id)
    {
        if($request->files->get('img')){
            try {
                $img = $request->files->get('img');
                $filename = pathinfo($img->getClientOriginalName(), PATHINFO_FILENAME);
                $newFilename = $filename.'-'.uniqid().'.'.$img->guessExtension();
                $newFilename =str_replace(' ', '', $newFilename);
                $path = $request->file('img')->storeAs(
                    'public/images', $newFilename
                );
            } catch (FileException $e) {
            }
        }
        $product = PostCategory::find($id);
        $product->img=$newFilename;
        $product->save();
        return response()->json([
            'message' => 'Product created',
            '$product' => $product,
        ], Response::HTTP_OK);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ecommerce\PostCategory  $product
     * @return JsonResponse
     */
    public function destroy($id)
    {
        //Buscamos el producto
        $product = PostCategory::findOrfail($id);
        //Eliminamos el producto
        $product->delete();
        //Devolvemos la respuesta
        return response()->json([
            'message' => 'Product deleted successfully'
        ], Response::HTTP_OK);
    }
}
