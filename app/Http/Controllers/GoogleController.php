<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Validator;
use Socialite;
use Exception;
use Auth;

class GoogleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function handleGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')->user();
           /* echo "<pre>";
            echo $user->id;
            var_dump($user);die;*/
            $finduser = User::where('google_id', $user->id)->orWhere('facebook_id', $user->id)->first();
            if ($finduser){
                User::updateOrCreate(['email' => $user->email],[
                        'google_id'=> $user->id
                    ]);
                Auth::login($finduser);
                return redirect()->intended('/dashboard');
            } else {
                $newUser = User::create([
                    'name' => $user->name,
                    'email' => $user->email,
                    'google_id' => $user->id,
                    'password' => bcrypt('123456dummy')
                ]);
                Auth::login($newUser);
                return redirect()->intended('/dashboard');
            }
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }
}
