<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\LikesController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VideoController;
use Illuminate\Http\Request;

Route::post('registration', [UserController::class, 'registraion']);
Route::get('videos/{offset}', [VideoController::class, 'getVideo']);
Route::get('video/{id}', [VideoController::class, 'getVideoById']);
Route::get('comments/{video_id}', [CommentController::class, 'getComments']);
Route::get('user/{nick}',[UserController::class, 'searchUser']);
Route::post('rating/{video_id}', [LikesController::class, 'getRating']);
Route::get('videobyuser/{user_nick}', [VideoController::class, 'getVideoByUserName']);

Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});

Route::middleware(['auth:api'])->group(function () {
    Route::post('upload', [VideoController::class,'loadVideo']);
    Route::post('loadcomm/{id}', [CommentController::class, 'loadComment']);
    Route::post('like/{video_id}', [LikesController::class, 'likes']);
    Route::post('dislike/{video_id}', [LikesController::class, 'dislikes']);
    
    Route::middleware(['role'])->group(function () {
        Route::put('new/{nick}',[UserController::class, 'newAdmin']);
        Route::put('down/{nick}',[UserController::class, 'downAdmin']);
        Route::put('banned/{id}', [VideoController::class, 'banned']);
        Route::put('bannedTen/{id}', [VideoController::class, 'bannedTen']);
        Route::put('passed/{id}', [VideoController::class, 'passed']);
    });
    
});


