<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function registraion(UserRequest $request)
    {
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        User::create($input);
        return response()->json('user created', 200);
    }

    public function login(Request $request){
        $input = $request->all();
        if(Auth::attempt(['email' => $input['email'], 'password' => $input['password']])){ 
            $user = User::find(Auth::user()->id); 
            return response()->json([$user],201);
        } 
        else{ 
            return response()->json(['error'=>true,'massage'=>'User not found'],404);
        } 
    }
}
