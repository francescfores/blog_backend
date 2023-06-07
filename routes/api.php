<?php

use App\Http\Controllers\blog\v1\PostController;
use App\Http\Controllers\v1\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class,'logout']);
    Route::post('refresh', [AuthController::class,'refresh']);

});
//Route::group(['middleware' => [\App\Http\Middleware\JwtMiddlware::class]], function() {
    Route::post('getUser', [AuthController::class,'me']);
    //post
    Route::get('post', [PostController::class, 'index']);
    Route::get('post_paginated', [PostController::class, 'paginated']);
    Route::get('post/{id}', [PostController::class, 'show']);
    Route::put('post/{id}', [PostController::class, 'update']);
    Route::delete('attribute/{id}', [PostController::class, 'destroy']);
    Route::post('attribute_image/{id}', [PostController::class, 'updateImage']);

//});
