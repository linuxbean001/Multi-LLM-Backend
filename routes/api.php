<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ForgotPasswordController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'auth'], function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('forget', [ForgotPasswordController::class, 'forgot_password']);
    Route::post('reset', [ForgotPasswordController::class, 'resetPassword']);

    Route::group(['middleware' => 'auth:sanctum'], function() {
      Route::put('updateuser/{id}', [AuthController::class, 'update']);
      Route::get('user', [AuthController::class, 'user']);
      Route::get('logout', [AuthController::class, 'logout']);
    });
});


/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/
