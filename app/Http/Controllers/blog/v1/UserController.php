<?php

namespace App\Http\Controllers\blog\v1;
use App\Http\Controllers\Controller;
use App\Models\Business;
use App\Models\Ecommerce\Attribute;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserController extends Controller
{
    public function __construct(Request $request)
    {
        //todo coment for debug mode
//        $token = $request->header('Authorization');
//        if($token != '')
//            //En caso de que requiera autentifiación la ruta obtenemos el usuario y lo almacenamos en una variable, nosotros no lo utilizaremos.
//            $this->user = JWTAuth::parseToken()->authenticate();
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Listamos todos los productos
        return User::get();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::with('roles')->find($id);
        if (!$user) {
            return response()->json([
                'message' => 'User not found.'
            ], 404);
        }
        return response()->json([
            'message' => 'User not found.',
            'data' => $user,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->only(
            'name',
            'email',
            ///'password',
            'phone',
            'address',
            'lastName',
            'roles'
        );
        $validator = Validator::make($data, [
            'name' => 'required|max:50|string',
            'email' => 'required|max:50|string',
            //'password' => 'required|max:50|string',
            'phone' => 'required|max:50|string',
            'address' => 'required|max:50|string',
            'lastName' => 'required|max:50|string',
            'roles' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        $user = User::findOrfail($id);
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            //'password' => bcrypt($request->password),
            'phone' => $request->phone,
            'address' => $request->address,
            'firstName' => '',
            'lastName' => $request->lastName,
        ]);
        //Devolvemos los datos actualizados.
        return response()->json([
            'message' => 'User updated successfully',
            'data' => $user
        ], Response::HTTP_OK);
    }


    public function paginated(Request $request){
        $users = User::paginate(5);
        return response()->json([
            'users_pg' => $users
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrfail($id);
        $user->delete();
        return response()->json([
            'message' => 'User deleted successfully'
        ], Response::HTTP_OK);
    }

    public function getBetweenDate(Request $request)
    {
        $data = $request->only(
            'date_start',
            'date_end',
        );
        $validator = Validator::make($data, [
            'date_start' => 'required|max:50|string',
            'date_end' => 'required|max:50|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        return response()->json([
            'message' => 'users',
             'data'=> User::
                 //->whereBetween('created_at', [$data['date_start'], $data['date_end']])
                 whereDate('created_at', '>=', $data['date_start'])
                 ->whereDate('created_at', '<=', $data['date_end'])
                 ->get()
        ], Response::HTTP_OK);
    }
}