<?php

namespace App\Models\blog\Component;

use App\Models\blog\PostContent;
use App\Models\blog\PostContentTypeAttribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComponentType extends Model
{
    use HasFactory;
    protected $table = 'component_type';

    protected $fillable = [
        'name',
        'desc',
    ];

    public function components()
    {
        return $this->hasMany(Component::class);
    }
}
