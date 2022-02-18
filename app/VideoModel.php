<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VideoModel extends Model
{
    protected $table = "video";

    protected $fillable = [
        'title_video', 'description_video', 'path', 'category', 'user_id'
    ];
}
