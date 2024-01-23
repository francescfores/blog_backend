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
        'global',
        'recycled_id',
        'global',
    ];
    protected $attributes = [
        'global' => false, // Establece el valor por defecto para el campo 'global'
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
        return $this->hasMany(Image::class);
    }
    public function attributes()
    {
        return $this->hasMany(PostContentAttribute::class);
    }

    public function subcontents2()
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

    /*new*/
    public function childs()
    {
        return $this->belongsToMany(PostContent::class, 'post_subcontents', 'content_parent_id', 'content_child_id');
    }
    public function parents()
    {
        return $this->belongsToMany(PostContent::class, 'post_subcontents', 'content_child_id', 'content_parent_id');
    }
    public function subcontents()
    {
        return $this->childs()->with(
            'subcontents',
//            'subcontentsparents',
            'type.attributes',
            'attributes',
        );
    }
    public function subcontentsparents()
    {
        return $this->parents()->with(
            'subcontentsparents',
//            'subcontents',
            'type.attributes',
            'attributes',
        );
    }
    public function findparent($id)
    {
        return $this->parents()->where('id', '!=', $id)->with(
            'subcontentsparents',
            'type.attributes',
            'attributes',
        );
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
