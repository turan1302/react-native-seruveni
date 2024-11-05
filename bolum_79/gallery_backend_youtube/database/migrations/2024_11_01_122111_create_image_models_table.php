<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('images', function (Blueprint $table) {
            $table->id('img_id');
            $table->string('img_name')->nullable();
            $table->text('img_desc')->nullable();
            $table->string('img_image')->nullable();
            $table->integer('img_client')->nullable();
            $table->softDeletes();
            $table->timestamp('img_created_at')->nullable();
            $table->timestamp('img_updated_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('images');
    }
};
