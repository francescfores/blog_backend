<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $fillable = [
        'num',
        'name',
        'desc',
        'img',
    ];

    public function category()
    {
        return $this->belongsTo(PostCategory::class);
    }
    public function tags()
    {
        return $this->belongsToMany(PostTag::class, 'posts_tags', 'post_id', 'post_tag_id');
    }
    public function comments()
    {
        return $this->hasMany(PostComment::class);
    }
    public function contents()
    {
        return $this->hasMany(PostContent::class);
    }
}
