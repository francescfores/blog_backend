<?php

namespace App\Http\Controllers\blog\v1;
use App\Http\Controllers\Controller;
use App\Models\blog\Post;
use App\Models\blog\PostCategory;
use App\Models\Client;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
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
        //Listamos todos los productos
        $posts = Post::with('category','tags','comments','contents','user','client')->get();
        $postscat = PostCategory::get();
        return response()->json([
            'clients' => $posts
        ], 200);
    }
    public function paginated(Request $request){
        $clients = Post::paginate(5);
        return response()->json([
            'clients' => $clients
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

        //Respuesta en caso de que todo vaya bien.

        //Validamos los datos
        $data = $request->only('type','name', 'desc', 'price','stock','img', 'category', 'subcategory', 'supercategory');
        $validator = Validator::make($data, [
            'type' => 'required|max:50|string',
            'name' => 'required|max:50|string',
            'desc' => 'required|max:50|string',
            'price' => 'required|max:50|string',
            'stock' => 'required|max:50|string',
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
        $product = Product::create([
            'type' => $request->type,
            'num' => $request->name,
            'name' => $request->name,
            'desc' => $request->desc,
            'price' => $request->price,
            'stock' => $request->stock,
            'img' => $newFilename,
        ]);
        $category = ProductCategory::find($request->category);
        $subcategory = ProductSubCategory::find($request->subcategory);
        $supercategory = ProductSuperCategory::find($request->supercategory);
        $product->category()->associate($category);
        $product->subcategory()->associate($subcategory);
        $product->supercategory()->associate($supercategory);
        $product->save();


        //variable type 2
        $variations = json_decode($request->input('variations'));
        if($variations){
            foreach ($variations as $index => $variation) {

                $variation_attributes = $variation->attributes;
                $variation_img = $request->file("variation.{$index}.img");
                //$variation_img->store('public/images');
                $filename = pathinfo($variation_img->getClientOriginalName(), PATHINFO_FILENAME);
                $newFilename = $filename.'-'.uniqid().'.'.$variation_img->guessExtension();
                $newFilename =str_replace(' ', '', $newFilename);
                $path = $variation_img->storeAs(
                    'public/images', $newFilename
                );
                $variation = Variation::create([
                    'price' => $variation->price,
                    'stock' => $variation->stock,
                    'img' => $newFilename,
                ]);
                foreach ($variation_attributes as $index => $attribute) {
                    $variation->attributes()->save(Attribute::find($attribute->id));
                }
                $product->variations()->save($variation);
            }
            $product->save();
        }

        //Respuesta en caso de que todo vaya bien.
        return response()->json([
            'message' => 'Product created',
            'data' => Product::with(['category','subcategory','supercategory', 'attributes', 'variations.attributes'])->find($product->id),
            '$path' => $path,
        ], Response::HTTP_OK);
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //Bucamos el producto
        $product = Product::with(['category','subcategory','supercategory', 'attributes', 'variations.attributes'])->find($id);
        //$product= Variation::with(['product', 'product.category', 'product.subcategory', 'product.supercategory', 'attributes'])->find($id);
        //Si el producto no existe devolvemos error no encontrado
        if (!$product) {
            return response()->json([
                'message' => 'Product not found.',
            ], 404);
        }
        //Si hay producto lo devolvemos
        return response()->json([
            'message' => 'Product not found.',
            'data' => $product
        ], 200);
    }
    public function showVariation($id)
    {
        //Bucamos el producto
        //$product = Product::with(['category','subcategory','supercategory', 'attributes', 'variations.attributes'])->find($id);
        $product= Variation::with(['product', 'product.category', 'product.subcategory', 'product.supercategory', 'attributes'])->find($id);
        //Si el producto no existe devolvemos error no encontrado
        if (!$product) {
            return response()->json([
                'message' => 'Product not found.',
            ], 404);
        }
        //Si hay producto lo devolvemos
        return response()->json([
            'message' => 'Product not found.',
            'data' => $product
        ], 200);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->only('name', 'desc', 'price','stock','img', 'category', 'subcategory', 'supercategory');
        $validator = Validator::make($data, [
            'name' => 'required|max:1000|string',
            'desc' => 'required|max:50|string',
            'price' => 'required|max:50|string',
            'stock' => 'required|max:50|string',
        ]);
        //Si falla la validación
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $product = Product::with(['variations.attributes'])->find($id);
        $product->name = $request->name;
        $product->desc = $request->desc;
        $product->price = $request->price;
        $product->stock = $request->stock;
        $product->type = $request->type;
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
        if($request->category){
            $category = ProductCategory::find($request->category);
            $product->category()->associate($category);
        }
        if($request->subcategory){
            $subcategory = ProductSubCategory::find($request->subcategory);
            $product->subcategory()->associate($subcategory);
        }
        if($request->supercategory){
            $supercategory = ProductSuperCategory::find($request->supercategory);
            $product->supercategory()->associate($supercategory);
        }
        $product->save();

        $variations = $request->input('variations');
        //product type 1
        if($product->type){
            $variation=$variations[0];
            $variationBD= Variation::find($variation['id']);
            $variationBD->attributes()->detach();
            $variation_attributes = $variation['attributes'];
            foreach ($variation_attributes as $index => $attribute) {
                $variationBD->attributes()->save(Attribute::find($attribute['id']));
            }
            $product->variations()->save($variationBD);
            $product->save();
        }

        //product type 2
        foreach ($variations as $index => $variation) {
            //si es nueva la creamos si no update
            if(isset($variation['new'])){

                $variation_attributes = $variation['attributes'];
                $variation_img = $request->file("variation.{$index}.img");
                //$variation_img->store('public/images');
                /*
                $filename = pathinfo($variation_img->getClientOriginalName(), PATHINFO_FILENAME);
                $newFilename = $filename.'-'.uniqid().'.'.$variation_img->guessExtension();
                $newFilename =str_replace(' ', '', $newFilename);
                $path = $variation_img->storeAs(
                    'public/images', $newFilename
                );
                */
                $variation = Variation::create([
                    'price' => $variation['price'],
                    'stock' => $variation['stock'],
                    'img' => '',
                ]);

                foreach ($variation_attributes as $index => $attribute) {

                    $variation->attributes()->save(Attribute::find($attribute['id']));
                }
                $product->variations()->save($variation);
            }else{

                $variationBD= Variation::find($variation['id']);
                $variationBD->price=$variation['price'];
                $variationBD->stock=$variation['stock'];
                $variationBD->save();
            }
        }

        $product->save();
        //Respuesta en caso de que todo vaya bien.
        return response()->json([
            'message' => 'Product created',
            'data' => $product,
        ], Response::HTTP_OK);
        //Devolvemos los datos actualizados.
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
        $product = Product::find($id);
        $product->img=$newFilename;
        $product->save();
        return response()->json([
            'message' => 'Product created',
            'data' => $product,
        ], Response::HTTP_OK);
    }
    public function updateImageVariation(Request $request, $id)
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
        $variation = Variation::find($id);
        $variation->img=$newFilename;
        $variation->save();
        return response()->json([
            'message' => 'Product created',
            '$product' => $variation,
        ], Response::HTTP_OK);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Buscamos el producto
        $product = Product::findOrfail($id);
        //Eliminamos el producto
        $product->delete();
        //Devolvemos la respuesta
        return response()->json([
            'message' => 'Product deleted successfully'
        ], Response::HTTP_OK);
    }
    public function productFilters(Request $request)
    {
        //$filters = json_decode(json_encode(request()->searchFilters));
        $query = Variation::with(['product','product.category', 'product.subcategory', 'product.supercategory', 'attributes']);
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
            $query->whereHas('product', function ($q) use ($filters) {
                $q->where('name', 'like', '%'.$filters['name'].'%');            });
        }
        if (!empty($filters['category'])) {
            $query->whereHas('product', function ($q) use ($filters) {
                $q->where('category_id', $filters['category']);
            });
        }
        if (!empty($filters['subcategory'])) {
            $query->whereHas('product', function ($q) use ($filters) {
                $q->where('subcategory_id', $filters['subcategory']);
            });
        }
        if (!empty($filters['supercategory'])) {
            $query->whereHas('product', function ($q) use ($filters) {
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

        $variationsByColorAndProductId = $query->get()->groupBy(['product_id', function ($variation) {
            return $variation->attributes->where('name', 'color')->first()->value;
        }]);

        $aux=[];
        foreach ($variationsByColorAndProductId as $prod){
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
            'message' => 'Product created',
            'data' => [
                'product' =>$paginatedAux,
                'product_pg' =>$paginatedAux,
                'count($aux)' =>$aux,
                'count($currentPage)' =>$currentPage,
            ],
        ], Response::HTTP_OK);

    }
    /*d
     $variations = $query->get(['product_id'])->pluck('product_id');

            $products_colors=[];
            $product = Product::whereIn('id', $variations)->get();
            foreach ($product as $value) {
                $variations = Variation::with(['product', 'product.category', 'product.subcategory', 'product.supercategory', 'attributes'])
                    ->where('product_id', $value->id)
                    ->get();
                $variationsByColor = $variations->groupBy(function ($variation) {
                    return $variation->attributes->where('name', 'color')->first()->value;
                });
                foreach ($variationsByColor as $key => $value) {
                    $products_colors[] = $variationsByColor[$key][0];
                }
            }

            return response()->json([
                'message' => 'Product created',
                'data' => [
                    'product' =>$products_colors,
                ],
            ], Response::HTTP_OK);
     */

}
