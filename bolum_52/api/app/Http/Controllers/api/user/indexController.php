<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class indexController extends Controller
{
    public function index(Request $request)
    {
        $data = $request->except("_token");
        $users = User::paginate(50);

        return response()->json($users,200);
    }
}
