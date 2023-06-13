<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostContentTypeAttribute extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'value1',
        'value2',
        'value3',
        'value4',
    ];

    public function type()
    {
        return $this->belongsTo(PostContentType::class, 'post_content_type_id');
    }

}
