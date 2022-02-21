<?php

namespace App\Http\Controllers;

use App\CommentModel;
use App\Http\Requests\CommentRequest;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    public function loadComment($id_video, CommentRequest $request){
        $inputs = $request->all();
        $user_id = auth()->id();
        $result = CommentModel::create([
            'text_comment' => $inputs['text'],
            'video_id' => $id_video,
            'user_id' => $user_id
        ]);
        if($result === false){
            return response()->json(['Не удалось загрузить'], 400);
        }else{
            return response()->json(['Успешно'], 200);
        }
    }

    public function getComments($video_id){
        $comments = CommentModel::getCommentsByIdVideo($video_id);
        return response()->json($comments, 200);
    }
}
