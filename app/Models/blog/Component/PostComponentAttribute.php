<?php

namespace App\Models\blog\Component;

use App\Models\blog\PostContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostComponentAttribute extends Model
{
    use HasFactory;
    protected $table = 'post_component_attribute';

    protected $fillable = [
        'name',
        'value',
    ];

    public function subcomponent()
    {
        return $this->belongsTo(Component::class, 'component_id');
    }
}
