<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    $faker = \Faker\Factory::create();
    $names = [];

    for ($i = 0; $i < 50; $i++) {
        $names[] = $faker->name;
    }

    return response()->json($names);
});
