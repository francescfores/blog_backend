<?php

namespace App\Models\blog\Component;

use App\Models\blog\Post;
use App\Models\blog\PostContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcomponent extends Model
{
    protected $fillable = ['component_parent_id', 'component_child_id','subcomponent_id','order'];
    protected $table = 'subcomponent';

    public function component()
    {
        return $this->belongsTo(Component::class,'component_child_id');
    }

    public function subcomponents()
    {
        return $this->belongsToMany(
            Subcomponent::class, 'relation_subcomponent',
            'subcomponent_id',
            'subcomponent_related_id')->with(
            'component.attributes',
            'component.type',
            'subcomponent_attributes',
            'subcomponents',
        )->orderBy('order');
    }

    public function subcomponent_attributes()
    {
        return $this->hasMany(SubcomponentAttribute::class, 'subcomponent_id');
    }
}
