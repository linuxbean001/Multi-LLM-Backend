<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Validator;

class AuthController extends Controller
{
    /**
    * Create user
    *
    * @param  [string] name
    * @param  [string] email
    * @param  [string] password
    * @param  [string] password_confirmation
    * @return [string] message
    */
    public function register(Request $request)
    {
        $request->validate([
            'f_name' => 'required|string',
            'l_name' => 'string',
            'email'=>'required|string|unique:users|email:rfc,dns',
            'password'=>'required|string',
            'c_password' => 'required|same:password',
            'profile_photo' => 'string',
            'role_id' => 'integer',
        ]);

        $user_array = [
            'f_name'  => $request->f_name,
            'l_name'  => $request->l_name,
            'profile_photo'  => $request->profile_photo,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ];
        if($request->role_id){
            $user_array['role_id'] = $request->role_id;
        }
        if($request->channel){
            $user_array['channel'] = $request->channel;
        }
        if($request->google_id){
            $user_array['google_id'] = $request->google_id;
        }
        if($request->facebook_id){
            $user_array['facebook_id'] = $request->facebook_id;
        }
        $user = new User($user_array);

        if($user->save()){
            /*$tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;*/

            return response()->json([
            'message' => 'Successfully created user!',
            'status' => 'success',
            // 'accessToken'=> $token,
            ],201);
        }
        else{
            return response()->json([
                'message'=>'Provide proper details',
                'status' => 'error',
            ]);
        }
    }

    /**
     * Login user and create token
    *
    * @param  [string] email
    * @param  [string] password
    * @param  [boolean] remember_me
    */

    public function login(Request $request)
    {
        $request->validate([
        'email' => 'required|string|email|email:rfc,dns',
        'password' => 'required|string',
        'remember_me' => 'boolean'
        ]);

        $credentials = request(['email','password']);
        if(!Auth::attempt($credentials))
        {
            return response()->json([
                'message' => 'Unauthorized',
                'status' => 'error',
            ],401);
        }

        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->plainTextToken;

        return response()->json([
            'accessToken' =>$token,
            'token_type' => 'Bearer',
            'status' => 'success',
            'user_details' => $user,
        ]);
    }

    /**
     * Get the authenticated User
    *
    * @return [json] user object
    */
    public function user(Request $request)
    {
        $user = $request->user();
        return response()->json([
            'status' => 'success',
            'user_fname' => $user->f_name,
            'user_lname' => $user->l_name,
            'user_email' => $user->email,
        ]);
    }

    public function update(Request $request, $id)
    {
        // Get a specific header value by key
        /*$authorizationHeader = $request->header('Authorization');
        if(!empty($authorizationHeader)){
            $hToken = explode('Bearer ', $authorizationHeader);
            print_r($hToken);
            die;
        }*/
        $request->validate([
            'f_name' => 'required|string',
            'l_name' => 'string',
            'password'=>'string',
            'profile_photo' => 'string',
            'role_id' => 'integer',
        ]);

        // Find the user by ID
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'User not found',
            'status' => 'error'], 404);
        }

        // Update the user's attributes
        if($request->f_name){
            $user->f_name = $request->input('f_name');
        }
        if($request->l_name){
            $user->l_name = $request->input('l_name');
        }
        if($request->password){
            $user->password = bcrypt($request->input('password'));
        }
        if($request->profile_photo){
            $user->profile_photo = $request->input('profile_photo');
        }
        // Add more fields as needed

        // Save the updated user
        if($user->save()){

            // Redirect back or wherever appropriate
            return response()->json([
                'message' => 'user Successfully updated!',
                'status' => 'success',
                // 'accessToken'=> $token,
                ],201);
        }
        else{
            return response()->json(['message'=>'Provide proper details',
            'status' => 'error',]);
        }
    }

    /**
    * Logout user (Revoke the token)
    *
    * @return [string] message
    */
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json([
        'message' => 'Successfully logged out'
        ]);

    }

}