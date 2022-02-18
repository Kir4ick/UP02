<?php

namespace App\Http\Requests;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class VideoRequest extends ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title_video' => 'min:4|max:30',
            'video' => 'mimes:mp4,mov,ogg,qt',
            'description_video' => 'min:10|max:255',
            'category' => 'min:1|max:200'
        ];
    }
}
