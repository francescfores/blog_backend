<?php

namespace App\Models\blog;

use App\Models\blog\Component\Component;
use App\Models\Client;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = 'post';

    use HasFactory;
    protected $fillable = [
        'num',
        'name',
        'subname',
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
//        return $this->hasMany(PostContent::class,'post_id');
        return $this->hasMany(PostContent::class)->with(
            ['attributes',
            'subcontents',
            'subcontents.type.attributes',
            'subcontents.attributes']
        );
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
        return $this->hasMany(Image::class);
    }

    //New database
    public function components()
    {
        return $this->belongsToMany(
            Component::class,
            'post_component',
            'post_id',
            'component_id');
    }
}
