<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// MOBILE KISMI
Route::group(["prefix"=>"mobile"],function (){
    // AUTHENTICATION
    Route::group(["prefix"=>"client","as"=>"client."],function (){
        Route::post("login",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"login"])->name("login");
        Route::post("register",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"register"])->name("register");

        Route::group(["middleware"=>"auth:api_client"],function (){
            Route::get("profile",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"profile"])->name("profile");
            Route::get("update-profile",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"update_profile"])->name("update_profile");
            Route::get("check",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"check"])->name("check");
            Route::get("logout",[\App\Http\Controllers\api\mobile\auth\client\indexController::class,"logout"])->name("logout");
        });
    });
});
