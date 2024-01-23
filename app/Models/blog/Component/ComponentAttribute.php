<?php

namespace App\Models\blog\Component;

use App\Models\blog\PostContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComponentAttribute extends Model
{
    use HasFactory;
    protected $table = 'component_attribute';

    protected $fillable = [
        'name',
        'value',
    ];

    public function component()
    {
        return $this->belongsTo(Component::class, 'component_id');
    }
}
