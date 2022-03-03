<?php

namespace App\Http\Controllers;

use App\LikesModel;
use Illuminate\Http\Request;

class LikesController extends Controller
{
    public function likes($video_id){
        $likes = LikesModel::where('video_id',$video_id)->where('user_id', auth('api')->user()->id)->first();
        if($likes === null){
            LikesModel::firstOrCreate([
                'user_id' => auth()->id(),
                'likes' => 1,
                'dislikes' => 0,
                'video_id' => $video_id
            ]);
            return response()->json(['status'=>true],200);
        }else if($likes->dislikes == 1){
           $likes->update([
            'likes' => 1,
            'dislikes' => 0
           ]);
           return response()->json(['status'=>true],200);
        }else{
            return response()->json(['status'=>false],400);
        }
    }

    public function dislikes($video_id){
        $dislikes = LikesModel::where('video_id',$video_id)->where('user_id', auth('api')->user()->id)->first();
        if($dislikes === null){
            LikesModel::firstOrCreate([
                'user_id' => auth()->id(),
                'likes' => 0,
                'dislikes' => 1,
                'video_id' => $video_id
            ]);
            return response()->json(['status'=>true],200);
        }else if($dislikes->likes == 1){
           $dislikes->update([
            'likes' => 0,
            'dislikes' => 1
           ]);
           return response()->json(['status'=>true],200);
        }else{
            return response()->json(['status'=>false],400);
        }
    }

    public function getRating($video_id){
        $likes = LikesModel::where('video_id', $video_id)->where('likes', 1)->count();
        $dislikes = LikesModel::where('video_id', $video_id)->where('dislikes', 1)->count();
        if(auth('api')->user() !== null){
            $user_rate = LikesModel::getLikes($video_id);
            if($user_rate !== null){
                $user_rate = $user_rate->likes;
                if($user_rate === 0){
                    $user_rate = 2;
                }

                return response()->json(['likes'=>$likes, 'dislikes'=>$dislikes, 'user_rate'=>$user_rate], 200);
            }
        }
        return response()->json(['likes'=>$likes, 'dislikes'=>$dislikes], 200);
    }
}
