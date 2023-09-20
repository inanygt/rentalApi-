<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Item;
use App\Models\Category;
use App\Models\Subcategory;
use App\Models\Subsubcategory;


class ItemController extends Controller
{
    //
    public function index()
    {
        $items = Item::all();
        return response()->json($items);
    }


    // Get items with category id
    public function itemsWithCat($id)
    {
        $category = Category::findOrFail($id);
        $items = $category->items;
        return response()->json($items);
    }

    // Get items with subcategory id
    public function itemsWithSubCat($id)
    {
        $subcategory = Subcategory::findOrFail($id);
        $items = $subcategory->items;
        return response()->json($items);
    }

    // Get items with subsubcategory id
    public function itemsWithSubSubCat($id)
    {
        $subsubcategory = Subsubcategory::findOrFail($id);
        $items = $subsubcategory->items;
        return response()->json($items);
    }
}
