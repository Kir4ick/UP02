<?php

namespace App\Http\Requests;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends ApiRequest
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
            'nickname' => 'min:4|max:50|unique:users|required',
            'email' => 'required|email',
            'password' => 'required|confirmed|min:6|max:20',
            'avatar' => 'mimes:jpeg,jpg,png,gif|required'
        ];
    }
}
