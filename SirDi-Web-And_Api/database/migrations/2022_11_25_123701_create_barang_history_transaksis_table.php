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
        Schema::create('barang_history_transaksis', function (Blueprint $table) {
            $table->id();
            // $table->foreignId('barang_id')->references('barang_id')->on('barangs')
            //     ->cascadeOnDelete()
            //     ->cascadeOnUpdate();
            $table->foreignId('history_transaksi_id')->references('history_transaksi_id')->on('history_transaksis')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->timestamps();
            $table->string('barang_id', 10);
        });
        Schema::table('barang_history_transaksis', function ($table) {
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
        // Schema::dropIfExists('barang_history_transaksis');
    }
};
