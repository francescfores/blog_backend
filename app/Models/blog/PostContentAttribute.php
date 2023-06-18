<?php

namespace App\Models\blog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostContentAttribute extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'value',
    ];

    public function content()
    {
        return $this->belongsTo(PostContent::class, 'post_content_id');
    }
}
