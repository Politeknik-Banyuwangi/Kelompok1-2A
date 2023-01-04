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
        Schema::create('barangs', function (Blueprint $table) {
            $table->string('barang_id')->unique();
            $table->foreignId('kategori_id')->references('kategori_id')->on('kategoris')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreignId('supplier_id')->references('supplier_id')->on('suppliers')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->string('nama');
            $table->integer('harga_beli');
            $table->integer('harga_jual');
            $table->integer('stok')->unsigned();
            $table->timestamps();
            $table->primary('barang_id');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('barangs');
    }
};
