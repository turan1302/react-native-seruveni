<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// MOBILE KISMI
Route::group(["prefix" => "mobile"], function () {
    // AUTHENTICATION
    Route::group(["prefix" => "client", "as" => "client."], function () {
        Route::post("login", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "login"])->name("login");
        Route::post("register", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "register"])->name("register");

        Route::group(["middleware" => "auth:api_client"], function () {
            Route::get("profile", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "profile"])->name("profile");
            Route::post("update-profile", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "update_profile"])->name("update_profile");
            Route::get("check", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "check"])->name("check");
            Route::get("logout", [\App\Http\Controllers\api\mobile\auth\client\indexController::class, "logout"])->name("logout");
        });
    });

    // RESIMLER (her kullanıcı için)
    Route::group(["prefix" => "images", "middleware" => "auth:api_client", "as" => "client."], function () {
        Route::get("", [\App\Http\Controllers\api\mobile\image\indexController::class,"index"])->name("index");
        Route::get("get-images", [\App\Http\Controllers\api\mobile\image\indexController::class,"get_images"])->name("get_images");
        Route::post("store", [\App\Http\Controllers\api\mobile\image\indexController::class,"store"])->name("store");
        Route::get("show/{id}", [\App\Http\Controllers\api\mobile\image\indexController::class,"show"])->name("show");
        Route::get("edit/{id}", [\App\Http\Controllers\api\mobile\image\indexController::class,"edit"])->name("edit");
        Route::post("update/{id}", [\App\Http\Controllers\api\mobile\image\indexController::class,"update"])->name("update");
        Route::post("delete", [\App\Http\Controllers\api\mobile\image\indexController::class,"delete"])->name("delete");
    });
});
