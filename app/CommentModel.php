<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CommentModel extends Model
{
    protected $table = 'comments';

    protected $fillable = [
        'text_comment', 'user_id', 'video_id'
    ];

    public static function getCommentsByIdVideo($video_id){
        $comments = DB::table('users')
        ->join('comments', 'users.id', '=', 'comments.user_id')->where('comments.video_id' , $video_id)
        ->select('users.nickname','comments.text_comment', 'comments.created_at')->get();
        return $comments;
    }
}
