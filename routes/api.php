<?php

use App\Http\Controllers\blog\v1\component\ComponentController;
use App\Http\Controllers\blog\v1\PostCategoryController;
use App\Http\Controllers\blog\v1\PostContentController;
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
    Route::post('post', [PostController::class, 'store']);
    Route::get('post/{id}', [PostController::class, 'show']);
    Route::put('post/{id}', [PostController::class, 'update']);
    Route::delete('post/{id}', [PostController::class, 'destroy']);
    Route::get('post/{id}/post_content_paginated/', [PostController::class, 'paginatedContent']);
    Route::delete('post/{post_id}/content/{content_id}', [PostController::class, 'destroyContentRelation']);
    Route::post('post/{post_id}/content/{content_id}', [PostController::class, 'addComponent']);

    //postcat
    Route::get('post_category', [PostCategoryController::class, 'index']);
    Route::get('post_category_paginated', [PostCategoryController::class, 'paginated']);
    Route::post('post_category', [PostCategoryController::class, 'store']);
    Route::get('post_category/{id}', [PostCategoryController::class, 'show']);
    Route::put('post_category/{id}', [PostCategoryController::class, 'update']);
    Route::delete('post_category/{id}', [PostCategoryController::class, 'destroy']);
    Route::post('post_category/{id}', [PostCategoryController::class, 'updateImage']);


    Route::get('post_content', [ComponentController::class, 'index']);
    Route::get('post_content_paginated', [ComponentController::class, 'paginated']);
    Route::post('post_content', [ComponentController::class, 'store']);
    Route::get('post_content/{id}', [ComponentController::class, 'show']);
    Route::put('post_content/{id}', [ComponentController::class, 'update']);
    Route::post('post_content/reorder/{id}', [ComponentController::class, 'reorder']);
    Route::delete('post_content/{id}', [ComponentController::class, 'destroy']);
    //refactor
    Route::delete('destroySubcomponent/{id}', [ComponentController::class, 'destroySubcomponent']);
    Route::post('post_content/{id}', [ComponentController::class, 'updateImage']);
    //todo create controller ContentType
    Route::get('post_content_type', [ComponentController::class, 'getTypes']);
    Route::post('component/filter', [ComponentController::class, 'filter']);

//});
