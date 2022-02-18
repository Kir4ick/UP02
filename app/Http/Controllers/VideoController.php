<?php

namespace App\Http\Controllers;

use App\CategoryModel;
use App\Http\Requests\VideoRequest;
use App\VideoModel;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    public function loadVideo(VideoRequest $request){
        $path = $request->file('video')->store('uploads/users_video', 'public');
        $inputs = $request->all();

        CategoryModel::firstOrCreate([
            'category' => $inputs['category']
        ]);

        $id = CategoryModel::where('category',$inputs['category'])->first();
        $idCategory = $id->id;
        $userId = auth()->id();

        $result = VideoModel::create([
            'title_video' => $inputs['title'],
            'description_video' => $inputs['description_video'],
            'user_id' => $userId,
            'path' => $path,
            'category' => $idCategory
        ]);

        if($result === false){
            return response()->json(['Не удалось загрузить'], 400);
        }else{
            return response()->json(['Успешно'], 200);
        }
    }

    public function banned($video_id){

    }

}
