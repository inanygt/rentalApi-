<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('items', function (Blueprint $table) {
             $table->string('title');
            $table->string('city');
            $table->string('region');
            $table->decimal('price_per_day', 10, 2);
            $table->decimal('price_per_extra_day', 10, 2);
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('subcategory_id');
            $table->unsignedBigInteger('user_id');
            $table->string('image');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('items', function (Blueprint $table) {
            $table->dropColumn(['title', 'city', 'region', 'price_per_day', 'price_per_extra_day', 'subcategory_id', 'images']);

        });
    }
};
