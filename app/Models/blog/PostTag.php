<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostTag extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'desc',
        'img',
    ];

    public function posts()
    {
        return $this->belongsToMany(Post::class, 'posts_tags', 'post_tag_id', 'post_id');
    }
}
