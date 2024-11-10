<?php

namespace App\Http\Requests\api\mobile\image;

use Illuminate\Foundation\Http\FormRequest;

class ImageUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "img_name" => "required|string|max:255",
            "img_image" => "nullable|image|mimes:jpeg,jpg,png|max:2048"
        ];
    }

    public function attributes()
    {
        return [
            "img_name" => "Resim Adı",
            "img_image" => "Resim"
        ];
    }
}
