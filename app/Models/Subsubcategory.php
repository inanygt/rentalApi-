<?php

namespace App\Models;
use App\Models\Subcategory;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subsubcategory extends Model
{
    use HasFactory;

    public function subcategory()
    {
        return $this->belongsTo(subcategory::class);
    }
}
