<?php

namespace App\Models\blog;

use App\Models\Client;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostComment extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'desc',
        'img',
    ];

    public function post()
    {
        return $this->hasMany(Post::class,'post_id');
    }

    public function client()
    {
        return $this->hasMany(Client::class,'post_id');
    }

    public function user()
    {
        return $this->hasMany(User::class,'post_id');
    }
}
