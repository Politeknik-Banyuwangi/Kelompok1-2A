<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('barang_masuks', function (Blueprint $table) {
            $table->id('barang_masuk_id');
            // $table->foreignId('barang_id')->references('barang_id')->on('barangs')
            //     ->cascadeOnDelete()
            //     ->cascadeOnUpdate();
            $table->string('barang_id', 10);
            $table->integer('jumlah');
            $table->timestamps();
        });
        Schema::table('barang_masuks', function ($table) {
            $table->foreign('barang_id')->references('barang_id')->on('barangs')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('barang_masuks');
    }
};
