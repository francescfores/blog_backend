<?php

namespace App\Models\blog\Component;

use App\Models\blog\Image;
use App\Models\blog\Post;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Component extends Model
{
    use HasFactory;
    protected $table = 'component';
    protected $fillable = [
        'name',
        'desc',
        'subcomponents',
        'type',
        'custom',
    ];

    public function subcomponents()
    {
        return $this->hasMany(Subcomponent::class,
            'component_parent_id',
            'id')->with(
            'subcomponents',
            'subcomponent_attributes',
            'component.type',
            'component.attributes',
        )->orderBy('order');
    }

    public function posts()
    {
        return $this->belongsToMany(
            Post::class,
            'post_component',
            'component_id',
            'post_id');
    }

    public function type()
    {
        return $this->belongsTo(ComponentType::class, 'component_type_id');
    }

    public function images()
    {
        return $this->hasMany(Image::class);
    }

    public function attributes()
    {
        return $this->hasMany(ComponentAttribute::class);
    }




    /*
     relación personalizada
     Este método subcomponentAttributes utiliza la relación hasManyThrough
     para acceder directamente a los SubcomponentAttribute desde el modelo Component.
    public function subcomponent_attributes()
    {
        return $this->hasManyThrough(
            SubcomponentAttribute::class,
            Subcomponent::class,
            'component_child_id',
            'subcomponent_id'
        );
    }

     */

    public function parents()
    {
        return $this->hasMany(Subcomponent::class,
            'component_child_id',
            'id')->with(
            'subcomponent_attributes',
            'component.subcomponents',
            'component.attributes',
            'component.type',
        );    }
    public function subcomponentsparents()
    {
        return $this->parents()->with(
            'subcomponentsparents',
//            'subcomponents',
            'type.attributes',
            'attributes',
        );
    }

    public function parentSubcomponents()
    {
        return $this->hasMany(Subcomponent::class, 'component_parent_id');
    }

    public function childSubcomponents()
    {
        return $this->hasMany(Subcomponent::class, 'component_child_id');
    }
}
