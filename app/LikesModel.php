<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LikesModel extends Model
{
    protected $table = "likes";

    protected $fillable = [
        'likes', 'dislikes', 'video_id', 'user_id'
    ];

    public $timestamps = false;

    public static function getLikes($video_id){
        $poles = Self::where('video_id', $video_id)->where('user_id', auth('api')->id())->first();
        return $poles;
    }
}
