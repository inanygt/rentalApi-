<?php

use App\Http\Controllers\Api\V1\CustomerController;
use App\Http\Controllers\Api\V1\InvoiceController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\http\Controllers\ItemController;
use App\http\Controllers\CategoryController;
use App\http\Controllers\ImageController;
use App\Models\Customer;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// get all items
Route::get('/items', [ItemController::class, 'index']);
// Get all categories
Route::get('/categories', [CategoryController::class, 'index'] );
// Get category with id
Route::get('/category/{id}', [CategoryController::class, 'category']);
// Get category with subcategories
Route::get('/categorywithsub/{id}', [CategoryController::class, "categorywithsub"]);

// Get subcategory
Route::get('/subcategory/{id}', [CategoryController::class, 'getsubcategory']);

// Get subcategory with subsubcategory
Route::get('/subcategorywithsub/{id}', [CategoryController::class, "subcategorywithsub"]);

Route::get('/images/{filename}', [ImageController::class, 'getImage'] );

// Get items
Route::get('items/cat/{id}', [ItemController::class, "itemsWithCat"]);
Route::get('items/subcat/{id}', [ItemController::class, "itemsWithSubCat"]);
Route::get('items/subsubcat/{id}', [ItemController::class, "itemsWithSubSubCat"]);

// Tut Rest Api
Route::group(['prefix' => 'v1', 'namespace' => 'App\Http\Controllers\Api\V1'], function() {
    Route::apiResource('customers', CustomerController::class);
    Route::apiResource('invoices', InvoiceController::class);

});
