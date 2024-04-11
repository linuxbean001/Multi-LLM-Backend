<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPasswordEmail;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use Validator;

class ForgotPasswordController extends Controller
{
    public function forgot_password(Request $request)
    {
        if(User::where('email', $request->email)->exists()) 
        {
            DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => Str::random(20),
                'created_at' => Carbon::now()
            ]);
            $tokenData = DB::table('password_resets')->where('email', $request->email)->first();
            if ($this->sendEmail($request->email, $tokenData->token)) {
                return response()->json([
                    'message' => 'Email sent successfully!',
                    'status' => 'success'
                ],201);
            } else {
                return 'A Network Error occurred. Please try again.';
            }   
        } else {
            Session::put('reset_password', 0);
            Session::put('token', '');
            return 'User does not exist';
        }
        
    }

    public function sendEmail($email, $token)
    {
        $resetLink = config('base_url') . 'password/reset/' . $token . '?email=' . urlencode($email);
        Mail::to($email)->send(new ResetPasswordEmail($resetLink));
        return 'Email sent successfully!';
    }

    public function resetPassword(Request $request)
    {
        $rules = array(
            'password'=>'required|string',
            'c_password' => 'required|same:password',
        );
        $validator = Validator::make( $request->all(), $rules);
        if ( $validator->fails() ) {
            return back()->withErrors($validator)->withInput();
        }
        $tokenData = DB::table('password_resets')->where('token', $request->token)->first();
        if (!$tokenData) {
            return 'Something went wrong';
        }
        $user = User::where('email', $tokenData->email)->first();
        if (!$user) {
            return 'Email not found';
        }
        $user->password = \Hash::make($request->password);
        $user->update();
        DB::table('password_resets')->where('email', $user->email)->delete();
        return response()->json([
            'message' => 'Password change successfully!',
            'status' => 'success'
        ],201);
    }
}
