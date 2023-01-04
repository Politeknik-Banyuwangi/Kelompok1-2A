<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BarangController;
use App\Http\Controllers\API\SupplierController;
use App\Http\Controllers\API\HistoryTransaksiController;
use App\Http\Controllers\API\kategoriController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get('/home', function () {
        return "halo";
    });
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/barang', [BarangController::class, 'semuaBarang']);
    Route::post('tambahkaryawan', [AuthController::class, 'tambahKaryawan']);
    Route::post('tambahbarang', [BarangController::class, 'tambahBarang']);
    Route::put('updateBarang/{barang}', [BarangController::class, 'updateBarang']);
    Route::delete('hapusBarang/{barang}', [BarangController::class, 'hapusBarang']);
    Route::post('tambahStok/{barang}', [BarangController::class, 'tambahStok']);
    Route::get('/kategori', [kategoriController::class, 'index']);
    Route::post('tambahkategori', [kategoriController::class, 'create']);
    Route::post('/transaksi', [HistoryTransaksiController::class, 'transaksi']);

    Route::get('/kategori', [kategoriController::class, 'index']);
    Route::post('tambahkategori', [kategoriController::class, 'create']);
    Route::put('updatekategori/{kategori}', [kategoriController::class, 'update']);
    Route::delete('hapuskategori/{kategori}', [kategoriController::class, 'destroy']);

    Route::get('/supplier', [SupplierController::class, 'index']);
    Route::post('tambahsupplier', [SupplierController::class, 'create']);
    Route::put('updatesupplier/{supplier}', [SupplierController::class, 'update']);
    Route::delete('hapussupplier/{supplier}', [SupplierController::class, 'destroy']);
    Route::get('/karyawan', [AuthController::class, 'daftarKaryawan']);
    Route::get('/transaksi', [HistoryTransaksiController::class, 'index']);
    Route::get('/hariini', [HistoryTransaksiController::class, 'hariIni']);
    Route::get('/totalhariini', [HistoryTransaksiController::class, 'totalHariIni']);
    Route::get('/barangmasuk', [HistoryTransaksiController::class, 'barangMasuk']);
    Route::put('/updatekaryawan/{user}', [AuthController::class, 'updateKaryawan']);
    Route::delete('/hapusKaryawan/{user}', [AuthController::class, 'hapusKaryawan']);
});
Route::post('login', [AuthController::class, 'login']);
