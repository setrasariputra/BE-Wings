<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function Pwd()
    {
        $pwdd = app('hash')->make('12068730#Penjualan');
        dd($pwdd);
    }

    public function login(Request $request)
    {
        $validated = $this->validate($request, [
            'user' => 'required',
            'password' => 'required',
        ]);

        $user_data = User::select('id','user')->where('user', $validated['user'])->first();
        if (empty($user_data)) {
            return response()->json(['status' => 'error', 'message' => 'User not found ']);
        }        

        $credentials = request(['user', 'password']);
        $refresh_token = auth()->setTTL(env('JWT_REFRESH_TTL'))->tokenById($user_data['id']);
        $token = auth()->setTTL(env('JWT_TTL'))->attempt($credentials);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $auth = array('user' => $user_data['user']);

        return $this->respondWithToken($token, $auth, $refresh_token);
    }

    public function me()
    {
        return response()->json(auth()->user());
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }
    protected function respondWithToken($token, $auth = '', $refresh_token = '')
    {
        return response()->json([
            'status' => 'success',
            'access_token' => $token,
            'refresh_token' => $refresh_token,  
            'auth' => $auth,          
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL(),            
        ]);
    }
}
