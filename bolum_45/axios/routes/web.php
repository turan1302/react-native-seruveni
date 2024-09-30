<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    $data = [
        [
            "name" => "Ali",
            "surname" => "Veli"
        ],
        [
            "name" => "Ahmet",
            "surname" => "Mehmet"
        ]
    ];

    return response()->json($data);
});
