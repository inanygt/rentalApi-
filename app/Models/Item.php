<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    public $timestamps = false;



    protected $fillable = [
        'title',
        'city',
        'region',
        'description',
        'price_per_day',
        'price_per_extra_day',
        'category_id',
        'subcategory_id',
        'subsubcategory_id',
        'user_id',
        'image',
        'borrowed',
        'borrowable',
        'visible',
    ];

      public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
