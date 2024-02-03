<?php

namespace App\Http\Controllers\v1;
use App\Http\Controllers\Controller;
//use App\Models\Business;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use function PHPUnit\Framework\isEmpty;

class AuthController extends Controller
{
    //Función que utilizaremos para registrar al usuario
    public function register(Request $request)
    {
        //Indicamos que solo queremos recibir name, email y password de la request
        $data = $request->only('name', 'email', 'password', 'phone', 'address', 'lastName', 'roles');
        //Realizamos las validaciones
        $validator = Validator::make($data, [
            'name' => 'required|string',
            'phone' => 'required|string',
            'roles' => 'required',
            'address' => 'required|string',
            'lastName' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6|max:50',
        ]);
        //Devolvemos un error si fallan las validaciones
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        //Creamos el nuevo usuario
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'phone' => $request->phone,
            'address' => $request->address,
            'firstName' => '',
            'lastName' => $request->lastName,
        ]);
        $rol = Role::findById($request->roles[0]);
            $user->assignRole($rol);

        //Nos guardamos el usuario y la contraseña para realizar la petición de token a JWTAuth
        $credentials = $request->only('email', 'password');
        //Devolvemos la respuesta con el token del usuario
        return response()->json([
            'message' => 'User created',
            'token' => JWTAuth::attempt($credentials),
            'user' => $request->roles[0]
        ], Response::HTTP_OK);
    }
    //Funcion que utilizaremos para hacer login
    public function login(Request $request)
    {
        //Indicamos que solo queremos recibir email y password de la request
        $credentials = $request->only('email', 'password');
        //Validaciones
        $validator = Validator::make($credentials, [
            'email' => 'required|email',
            'password' => 'required|string|min:6|max:50'
        ]);
        //Devolvemos un error de validación en caso de fallo en las verificaciones
        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }
        //Intentamos hacer login
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                //Credenciales incorrectas.
                return response()->json([
                    'message' => 'Login failed',
                ], 401);
            }
        } catch (JWTException $e) {
            //Error chungo
            return response()->json([
                'message' => 'Error',
            ], 500);
        }
        //Devolvemos el token
//        $user = Auth::user();
        $user = User::with('roles')->find(Auth::id());

        return response()->json([
            'token' => $token,
            'user' => $user
        ]);
    }
    //Función que utilizaremos para eliminar el token y desconectar al usuario
//    public function logout(Request $request)
//    {
//        //Validamos que se nos envie el token
//        $validator = Validator::make($request->only('token'), [
//            'token' => 'required'
//        ]);
//        //Si falla la validación
//        if ($validator->fails()) {
//            return response()->json(['error' => $validator->messages()], 400);
//        }
//        try {
//            //Si el token es valido eliminamos el token desconectando al usuario.
//            JWTAuth::invalidate($request->token);
//            return response()->json([
//                'success' => true,
//                'message' => 'User disconnected'
//            ]);
//        } catch (JWTException $exception) {
//            //Error chungo
//            return response()->json([
//                'success' => false,
//                'message' => 'Error'
//            ], Response::HTTP_INTERNAL_SERVER_ERROR);
//        }
//    }
    //Función que utilizaremos para obtener los datos del usuario y validar si el token a expirado.
    public function getUser(Request $request)
    {
        //Validamos que la request tenga el token
        $this->validate($request, [
            'token' => 'required'
        ]);
        //Realizamos la autentificación
        $user = JWTAuth::authenticate($request->token);
        //Si no hay usuario es que el token no es valido o que ha expirado
        if(!$user)
            return response()->json([
                'message' => 'Invalid token / token expired',
            ], 401);
        //Devolvemos los datos del usuario si todo va bien.
        return response()->json(['user' => $user]);
    }


//    /**
//     * Get a JWT via given credentials.
//     *
//     * @return \Illuminate\Http\JsonResponse
//     */
//    public function login()
//    {
//        $credentials = request(['email', 'password']);
//
//        if (! $token = auth()->attempt($credentials)) {
//            return response()->json(['error' => 'Unauthorized'], 401);
//        }
//
//        return $this->respondWithToken($token);
//    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
//            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    //    public function checkEmail(Request $request){
//        $email = $request->email;
//
//        $records = DB::table('users')
//            ->where('users.email', 'like', '%' .$email . '%')
//            ->select('users.*')
//            ->get();
//        $bol = true;
//        if(count($records)===0){
//            $bol = false;
//        }
//
//        return response()->json($bol);
//    }

}
