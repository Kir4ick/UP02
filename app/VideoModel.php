<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class VideoModel extends Model
{
    protected $table = "video";

    protected $fillable = [
        'title_video', 'description_video', 'path', 'user_id' , 'category', 'preview'
    ];

    public static function getVideoByUserNickname($nickname){
        $comments = DB::table('users')
        ->join('video', 'users.id', '=', 'video.user_id')->
        where('users.nickname' , $nickname)
        ->select('video.*')
        ->get();
        return $comments;
    }
}
