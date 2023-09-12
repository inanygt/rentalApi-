<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Subcategory;

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

    // Get subcategory
    public function getSubCategory($id) {
        $subCategory = Subcategory::find($id);
        if (!$subCategory) {
        return response()->json(['error' => 'Category not found'], 404);
    }

    return response()->json($subCategory);
    }

    // Get subcategory with sub sub category one to many
    public function subCategoryWithSub($id)
    {
        $subcategory = Subcategory::with('subsubcategory')->find($id);
        if (!$subcategory) {
        return response()->json(['error' => 'Category not found'], 404);
    }

    return response()-> json($subcategory);
    }
}
