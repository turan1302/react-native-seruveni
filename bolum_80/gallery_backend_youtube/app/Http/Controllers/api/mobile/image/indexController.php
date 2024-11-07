<?php

namespace App\Http\Controllers\api\mobile\image;

use App\Http\Controllers\api\BaseController;
use App\Http\Controllers\Controller;
use App\Http\Requests\api\mobile\image\ImageCreateRequest;
use App\Http\Requests\api\mobile\image\ImageUpdateRequest;
use App\Models\ImageModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class indexController extends BaseController
{
    private $uploadFolder;

    public function __construct()
    {
        $this->uploadFolder = "images/";
    }

    public function index(Request $request)
    {
        $client = $request->user();
        $images = ImageModel::where("img_client", $client->id)->orderBy("img_created_at", "desc")
            ->get()
            ->groupBy(function ($item) {
                return Carbon::parse($item->img_created_at)->toDateString();
            });

        $groupedData = [];

        foreach ($images as $date => $items) {
            $groupedData[] = [
                "date" => $date,
                "records" => $items // o tarihe ait kayıtlar
            ];
        }

        return parent::success("Resimler getirildi", $groupedData, 200);
    }

    public function get_images(Request $request)
    {
        $client = $request->user();
        $images = ImageModel::where("img_client", $client->id)->orderBy("img_created_at", "desc")
            ->get();

        return parent::success("Resimler getirildi", $images, 200);
    }

    public function store(ImageCreateRequest $request)
    {
        $data = $request->except("_token");

        $client = $request->user();
        $data["img_client"] = $client->id;

        if ($request->hasFile("img_image")) {
            $file = $request->file("img_image");
            $name = Str::slug($client->c_name) . "-" . $client->id . "-" . uniqid() . "." . $file->getClientOriginalExtension();

            $data["img_image"] = $file->storeAs($this->uploadFolder . $name);
        }

        $result = ImageModel::create($data);

        if ($result) {
            return parent::success("Resim ekleme işlemi başarılı", [], 201);
        } else {
            return parent::error("Resim ekleme işleminde bir hata oluştu. Lütfen daha sonra tekrar deneyiniz", [], 500);
        }
    }

    public function show(Request $request, $id)
    {
        $data = $request->except("_token");
        $client = $request->user();

        $image = ImageModel::where([
            ["img_id", "=", $id],
            ["img_client", "=", $client->id],
        ])->first();

        if ($image) {
            return parent::success("Resim bilgileri getirildi", $image, 200);
        } else {
            return parent::error("Resim bulunamadı", [], 404);
        }
    }

    public function edit(Request $request, $id)
    {
        $data = $request->except("_token");
        $client = $request->user();

        $image = ImageModel::where([
            ["img_id", "=", $id],
            ["img_client", "=", $client->id],
        ])->first();

        if ($image) {
            return parent::success("Resim bilgileri getirildi", $image, 200);
        } else {
            return parent::error("Resim bulunamadı", [], 404);
        }
    }

    public function update(ImageUpdateRequest $request, $id)
    {
        $data = $request->except("_token");
        $client = $request->user();

        $image = ImageModel::where([
            ["img_id", "=", $id],
            ["img_client", "=", $client->id],
        ])->first();

        if ($image) {

            // resim kontrol
            $data["img_image"] = $image->img_image;
            if ($request->hasFile("img_image")) {
                if ($image->img_image != "" && File::exists("storage/" . $image->img_image)) {
                    File::delete("storage/" . $image->img_image);
                }

                $file = $request->file("img_image");
                $name = Str::slug($client->c_name) . "-" . $client->id . "-" . uniqid() . "." . $file->getClientOriginalExtension();

                $data["img_image"] = $file->storeAs($this->uploadFolder . $name);
            }

            $result = ImageModel::where([
                ["img_client", "=", $client->id],
                ["img_id", "=", $id],
            ])->update($data);

            if ($result) {
                return parent::success("Resim güncelleme işlemi başarılı", [], 200);
            } else {
                return parent::error("Resim güncelleme işlemi başarısız", [], 500);
            }
        } else {
            return parent::error("Resim bulunamadı", [], 404);
        }
    }

    public function delete(Request $request)
    {
        $data = $request->except("_token");
        $client = $request->user();

        $image = ImageModel::where([
            ["img_id", "=", $data["img_id"]],
            ["img_client", "=", $client->id],
        ])->first();

        if ($image) {
            if ($image->img_image != "" && File::exists("storage/" . $image->img_image)) {
                File::delete("storage/" . $image->img_image);
            }

            $result = ImageModel::where([
                ["img_client", "=", $client->id],
                ["img_id", "=", $data["img_id"]],
            ])->delete();

            if ($result) {
                return parent::success("Resim silme işlemi başarılı", [], 200);
            } else {
                return parent::error("Resim silme işlemi başarısız", [], 500);
            }

        } else {
            return parent::error("Resim bulunamadı", [], 404);
        }
    }
}
