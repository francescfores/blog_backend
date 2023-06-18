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
        'subcontents',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }
    public function type()
    {
        return $this->belongsTo(PostContentType::class, 'post_content_type_id');
    }
    public function images()
    {
        return $this->hasMany(PostImage::class);
    }
    public function attributes()
    {
        return $this->hasMany(PostContentAttribute::class);
    }

    public function subcontents()
    {
        return $this->hasMany(PostContent::class, 'post_content_id')->with(
            'subcontents',
            'subcontents.type.attributes',
            'subcontents.attributes',
        );
    }

    public function parent()
    {
        return $this->belongsTo(PostContent::class, 'post_content_id');
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
