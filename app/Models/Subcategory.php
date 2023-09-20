<?php

namespace App\Models;
use App\Models\Subsubcategory;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
    use HasFactory;

     public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subsubcategory()
    {
        return $this->hasMany(Subsubcategory::class);
    }

    public function items()
{
    return $this->hasMany(Item::class, 'subcategory_id');
}
}
