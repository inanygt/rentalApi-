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

    public function store(Request $request) {

        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'city' => 'required',
            'region' => 'required',
            'price_per_day' => 'required',
            'price_per_extra_day' => 'required',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'subsubcategory_id' => 'required',
            'user_id' => 'required',
            'image' => 'required',
            'borrowed' => 'required',
            'borrowable' => 'required',
            'visible' => 'required',
        ]);

        return Item::create($request->all());
    }

    public function show($id) {
        $item = Item::findOrFail($id);
        return response()->json($item);
    }

       public function update(Request $request, $id)
    {
        $alien = Item::findOrFail($id);
        $alien->update($request->all());
        return response()->json($alien, 200);
    }

    public function destroy($id)
    {
        Item::destroy($id);
        return response()->json(null, 204);
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

    public function getUserId($itemId)
    {
        $item = Item::find($itemId);
        if (!$item) {
        return response()->json(['error' => 'Item not found'], 404);
    }

        $user = $item->user;
        if (!$user) {
        return response()->json(['error' => 'User not found for this item'], 404);
    }
    return response()->json($user);
    }
}
