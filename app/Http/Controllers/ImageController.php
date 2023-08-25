<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class ImageController extends Controller
{
    //
    public function getImage($id)
    {
        $category = Category::find($id);

        if ($category && $category->image) {
            $imagePath = '/storage/' . $category->image; // Construct the image URL
            return response()->json(['image_url' => $imagePath]);
        }

        return response()->json(['message' => 'Category not found or image not available'], 404);
    }
}
