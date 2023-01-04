<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\barangwebController;
use App\Http\Controllers\kategoriController;
use App\Http\Controllers\produkController;
use App\Http\Controllers\HistoryTransaksiController;
use App\Http\Controllers\supplierController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});
Route::get('/verifikasi/{email}', [AuthController::class, 'verifikasi']);
Auth::routes();
// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// Route::resource('kategori', kategoriController::class);
// Route::get('kategori', [kategoriController::class, 'index']);
// Route::get('/carikategori', [kategoriController::class, 'search'])->name('carikategori');
// Route::get('/caribarang', [barangwebController::class, 'search'])->name('caribarang');
// Route::resource('barang', barangwebController::class);

Route::middleware(['auth'])->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::resource('barang', barangwebController::class);
    Route::resource('kategori', kategoriController::class);
    Route::resource('supplier', supplierController::class);
    Route::resource('transaksi', HistoryTransaksiController::class);
    Route::resource('user', UserController::class);
    Route::get('/search', [HistoryTransaksiController::class, 'search'])->name('search');
    Route::get('/carikategori', [kategoriController::class, 'search'])->name('carikategori');
    Route::get('/caribarang', [barangwebController::class, 'search'])->name('caribarang');
    Route::get('/carisupplier', [supplierController::class, 'search'])->name('carisupplier');
    Route::post('/barang/cetak-barcode', [ProdukController::class, 'cetakBarcode'])->name('produk.cetak_barcode');
    Route::post('/history-transaksi/transaksi', [HistoryTransaksiController::class, 'transaksi']);
    Route::get('/lihathistory', [HistoryTransaksiController::class, 'getHistory']);
});
