<?php

namespace App\Models\blog;

use App\Models\blog\Component\Component;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
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
    public function contents()
    {
        return $this->belongsTo(PostContent::class, 'post_content_id');
    }

    //new database
    public function components()
    {
        return $this->belongsTo(Component::class, 'component_id');
    }

}
