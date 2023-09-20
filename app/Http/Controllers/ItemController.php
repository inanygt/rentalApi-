<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Item;
use App\Models\Category;
use App\Models\Subcategory;
use App\Models\SubsubcategorySubcategory;


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
        $items = Item::where('category_id', $id)->get();
        return response()->json($items);
    }

    // Get items with subcategory id
    public function itemsWithSubCat($id)
    {

        $items = Item::where('subcategory_id', $id)->get();
        return response()->json($items);

    }

    // Get items with subsubcategory id
    public function itemsWithSubSubCat($id)
    {

     $items = Item::where('subsubcategory_id', $id)->get();
        return response()->json($items);

    }
}
