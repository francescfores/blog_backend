<?php

namespace App\Models\blog;

use App\Models\Client;
use App\Models\User;
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
        return $this->belongsTo(PostCategory::class, 'post_category_id');
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
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function client()
    {
        return $this->belongsTo(Client::class);
    }
    public function images()
    {
        return $this->hasMany(PostImage::class);
    }
}
