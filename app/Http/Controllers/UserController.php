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
        $path = $request->file('avatar')->store('uploads/users', 'public');
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        User::create($input, ['avatar'=>$path]);
        return response()->json('user created', 200);
    }

    public function searchUser($user_nickname){
        $user = User::where('nickname', $user_nickname)->first();
        return response()->json($user, 200);
    }
    
    public function newAdmin($user_nickname){
        User::where('nickname', $user_nickname)->update(['roles'=>'admin']);
        return response()->json(['Новый Админ был добавлен!'], 200);
    }

    public function downAdmin($user_nickname){
        User::where('nickname', $user_nickname)->update(['roles'=>'user']);
        return response()->json(['Пользователь: '.$user_nickname.' перестал быть админом'], 200);
    } 
}
