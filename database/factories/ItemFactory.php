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
        'title' => $this->faker->sentence,
        'city' => $this->faker->city,
        'region' => $this->faker->state,
        'price_per_day' => $this->faker->randomFloat(2, 50, 200),
        'price_per_extra_day' => $this->faker->randomFloat(2, 20, 100),
        'subcategory_id' => $this->faker->numberBetween(1, 10),
        'category_id' => $this->faker->numberBetween(1, 10),
        'user_id' => $this->faker->numberBetween(1,10),
        'image' => $this->faker->sentence,
        ];
    }
}
