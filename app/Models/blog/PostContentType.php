<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostContentType extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'desc',
    ];

    public function postContents()
    {
        return $this->hasMany(PostContent::class,'post_content_id');
    }
}
