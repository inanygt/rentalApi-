<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Item>
 */
class ItemFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
        'title' => $this->faker->words($this->faker->numberBetween(1, 2), true), // Generate 1 or 2 fake words
        'description' => $this->faker->paragraph,
        'city' => $this->faker->city,
        'region' => $this->faker->state,
        'price_per_day' => $this->faker->numberBetween(5, 20), // Generate integer between 5 and 20
        'price_per_extra_day' => $this->faker->numberBetween(5, 20), // Generate integer between 5 and 20
        'subcategory_id' => $this->faker->numberBetween(1, 30),
        'subsubcategory_id' => $this->faker->numberBetween(1, 30),
        'category_id' => $this->faker->numberBetween(1, 12),
        'user_id' => $this->faker->numberBetween(1,50),
        'image' => $this->faker->sentence,
        'borrowable' => $this->faker->boolean,
        'visible' => $this->faker->boolean,
        'borrowed' => $this->faker->numberBetween(1,20)
        ];
    }
}
