<?php

namespace App\Http\Controllers;

use App\CategoryModel;
use App\CommentModel;
use App\Http\Requests\VideoRequest;
use App\User;
use App\VideoModel;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    public function loadVideo(VideoRequest $request){
        $path = $request->file('video')->store('uploads/users_video', 'public');
        $path_preview =$request->file('preview')->store('upload/users_video/previews', 'public');
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
            'preview' => $path_preview,
            'category' => $idCategory
        ]);

        return response()->json(['Успешно'], 200);
    }

    public function banned($video_id){
        VideoModel::where('id', $video_id)->delete();
        return response()->json(['Ролик был забанен']);
    }

    public function bannedTen($video_id){
        VideoModel::where('id', $video_id)->update(['verificy'=> 2]);
        return response()->json(['На ролик был наложен теневой бан']);
    }

    public function passed($video_id){
        VideoModel::where('id', $video_id)->update(['verificy' => 3]);
        return response()->json(['Ролик был выложен']);
    }

    public function getVideo($offset){
        $videos = VideoModel::getUserInVideo($offset);
        return response()->json($videos, 200);
    }

    public function getVideoById($id){
        $video = VideoModel::find($id);
        $user = User::find($video->user_id);
        if($video === null){
            return response()->json('Нет такого контента', 404);
        }
        return response()->json([$video, $user], 200);
    }

    public function getVideoByVer(){
        $videos = VideoModel::get();
        return response()->json($videos, 200);
    }

    public function getVideoByUserName($user_nickname){
        $video = VideoModel::getVideoByUserNickname($user_nickname);
        return response()->json($video, 200);
    }

    public function View($video_id){
        $view = VideoModel::find($video_id)->views;
        VideoModel::where('id', $video_id)->update(['views'=>$view + 1]);
    }
}
