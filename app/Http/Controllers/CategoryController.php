<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    //
    public function index()
{
    $categories = Category::with('subcategories')->get();
    return response()->json($categories);
}

public function category($id)
{

        $category = Category::find($id);


    if (!$category) {
        return response()->json(['error' => 'Category not found'], 404);
    }

    return response()->json($category);
}

    public function categoryWithSub($id) {
         $category = Category::with('subcategories')->find($id);

    if (!$category) {
        return response()->json(['error' => 'Category not found'], 404);
    }

    return response()->json($category);
    }
}
