<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostContent extends Model
{
    use HasFactory;
    protected $fillable = [
        'num',
        'name',
        'type',
        'desc',
        'img',
        'img_url',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }
    public function type()
    {
        return $this->belongsTo(PostContentType::class, 'post_content_type_id');
    }
//
//    public function client()
//    {
//        return $this->hasMany(User::class,'post_id');
//    }
//
//    public function user()
//    {
//        return $this->hasMany(User::class,'post_id');
//    }
}
