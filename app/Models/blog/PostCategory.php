<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostCategory extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'desc',
        'img',
    ];

    public function posts()
    {
        return $this->hasMany(Post::class,'post_id');
    }
}
