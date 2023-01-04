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
        // Schema::create('stoks', function (Blueprint $table) {
        //     $table->id('stok_id');
        //     $table->foreignId('barang_id')->references('barang_id')->on('barangs')
        //         ->cascadeOnDelete()
        //         ->cascadeOnUpdate();
        //     $table->integer('jumlah');
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('stoks');
    }
};
