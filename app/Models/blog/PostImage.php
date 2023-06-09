<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostImage extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'url',
        'desc',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }
}
