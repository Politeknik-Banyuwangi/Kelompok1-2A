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
        Schema::create('history_transaksis', function (Blueprint $table) {
            $table->id('history_transaksi_id');
            $table->foreignId('user_id')->references('id')->on('users')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->integer('jumlah');
            $table->integer('total');
            $table->integer('laba');
            $table->timestamps();
            // $table->string('barang_id', 10);
        });
        // Schema::table('history_transaksis', function ($table) {
        //     $table->foreign('barang_id')->references('barang_id')->on('barangs')
        //         ->cascadeOnDelete()
        //         ->cascadeOnUpdate();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('history_transaksis');
    }
};
