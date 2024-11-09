<?php

namespace App\Http\Controllers\api\mobile\auth\client;

use App\Http\Controllers\api\BaseController;
use App\Http\Controllers\Controller;
use App\Http\Requests\api\mobile\auth\client\RegisterRequest;
use App\Models\ClientModel;
use App\Models\ImageModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class indexController extends BaseController
{
    public function login(Request $request)
    {
        $data = $request->except("_token");

        $user = ClientModel::where("email", $data["email"])->first();

        if ($user && Hash::check($data["password"], $user->password)) {
            $token = $user->createToken("gallery")->accessToken;

            return parent::success("Kullanıcı Giriş İşlemi Başarılı", [
                "id" => $user->id,
                "c_name" => $user->c_name,
                "c_surname" => $user->c_surname,
                "email" => $user->email,
                "token_type" => "Bearer",
                "access_token" => $token
            ]);

        } else {
            return parent::error("Kullanıcı bilgileri hatalı", [], 401);
        }
    }
    public function register(RegisterRequest $request)
    {
        $data = $request->except("_token", "password_confirmation");

        $user = ClientModel::create($data);

        if ($user) {
            return parent::success("Kullanıcı Oluşturuldu. Bilgilerinizle Giriş Yapabilirsiniz", [
                "user" => $user
            ], 201);
        } else {
            return parent::error("Kullanıcı Oluşturulurken Hata Oluştu", [], 500);
        }
    }
    public function profile(Request $request)
    {
        $user = $request->user();

        $currentMonthStart = Carbon::now()->startOfMonth();
        $currentMonthEnd = Carbon::now()->endOfMonth();

        $total_image = ImageModel::where([
            ["img_client","=",$user->id]
        ])->count();

        $total_month = ImageModel::where([
            ["img_client","=",$user->id]
        ])->whereBetween("img_created_at",[$currentMonthStart,$currentMonthEnd])
            ->count();

        $last_photo = ImageModel::where([
            ["img_client","=",$user->id]
        ])->orderBy("img_created_at","desc")->first();

        return parent::success("Kullanıcı Bilgileri Getirildi", [
            "user" => $user,
            "total_image" => $total_image,
            "total_month" => $total_month,
            "last_photo" => $last_photo
        ]);
    }
    public function update_profile(Request $request)
    {
        $user = $request->user();
        $data = $request->except("_token", "password_confirmation");

        if ($data["email"] !== $user->email) {
            $count = ClientModel::where("email", $data["email"])->frist();

            if ($count) {
                return parent::error("Aynı E-Mail Adresine Ait Kullanıcı Var", [], 422);
            }
        }

        $update = ClientModel::where("id", $user->id)->update([
            "c_name" => $data["c_name"],
            "c_surname" => $data["c_surname"],
            "email" => $data["email"],
            "password" => ($data["password"] === "") ? $user->password : Hash::make($data["password"])
        ]);


        if ($update) {
            $token = $user->createToken("gallery")->accessToken;

            return response()->json([
                "success" => true,
                "title" => "Başarılı",
                "message" => "İşlem Başarılı. Yeni bilgilerinizle Giriş Yapabilirsiniz",
                "isLoggedIn" => true,
                "data" => [
                    "id" => $user->id,
                    "c_name" => $user->c_name,
                    "c_surname" => $user->c_surname,
                    "email" => $user->email,
                    "token_type" => "Bearer",
                    "access_token" => $token
                ]
            ]);

        } else {
            return parent::error("İşlem Başarısız", [], 500);
        }
    }
    public function check(Request $request)
    {
        $user = $request->user();

        if ($user) {
            $token = $user->createToken("gallery")->accessToken;

            return response()->json([
                "success" => true,
                "isLoggedIn" => true,
                "data" => [
                    "id" => $user->id,
                    "c_name" => $user->c_name,
                    "c_surname" => $user->c_surname,
                    "email" => $user->email,
                    "token_type" => "Bearer",
                    "access_token" => $token
                ]
            ]);

        } else {
            return response()->json([
                "success" => false,
                "isLoggedIn" => false
            ]);
        }
    }
    public function logout(Request $request)
    {
        $user = $request->user();
        $token = $user->token();
        $token->revoke();

        return parent::success("Çıkış Gerçekleştirildi",[],200);
    }
}
