<?php

namespace App\Models\blog\Component;

use App\Models\blog\PostContent;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubcomponentAttribute extends Model
{
    use HasFactory;
    protected $table = 'subcomponent_attribute';

    protected $fillable = ['subcomponent_id', 'name', 'value'];

    //public function subcomponent()
    //{
    //    return $this->belongsTo(Subcomponent::class, 'subcomponent_id');
    //}
}
