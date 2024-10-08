<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix'=>'/'],function (){
    Route::get('',[\App\Http\Controllers\api\user\indexController::class,'index']);
});
