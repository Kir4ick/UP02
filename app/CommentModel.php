<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommentModel extends Model
{
    protected $table = 'comments';

    protected $fillable = [
        'text_comment', 'user_id', 'video_id'
    ];
}
