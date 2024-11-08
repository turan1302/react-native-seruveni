<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ImageModel extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = "images";
    protected $guarded = [];
    protected $primaryKey = "img_id";
    public const CREATED_AT = "img_created_at";
    public const UPDATED_AT = "img_updated_at";
}
