<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VideoController;
use Illuminate\Http\Request;


Route::post('/registration', [UserController::class, 'registraion']);

Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});

Route::middleware(['auth:api'])->group(function () {
    Route::post('upload', [VideoController::class,'loadVideo']);
    Route::post('loadcomm/{id}', [CommentController::class, 'loadComment']);
    Route::middleware(['role'])->group(function () {
        Route::post('user/{nick}',[UserController::class, 'searchUser']);
        Route::post('new/{nick}',[UserController::class, 'newAdmin']);
        Route::post('down/{nick}',[UserController::class, 'downAdmin']);
    });
    
});


