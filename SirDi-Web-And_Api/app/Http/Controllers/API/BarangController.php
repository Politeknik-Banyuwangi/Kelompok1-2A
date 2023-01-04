<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Barang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class BarangController extends Controller
{
    public function semuaBarang()
    {
        return response()->json([
            'status' => true,
            'data'  => Barang::with(['kategori', 'supplier', 'barangMasuk'])->cari(request('kategori'), request('nama'))->orderBy('stok', 'ASC')->get()
        ]);
    }
    public function tambahBarang(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'barang_id'     => 'required',
            'kategori_id'   => 'required',
            'supplier_id'   => 'required',
            'nama'          => 'required',
            'harga_beli'    => 'required',
            'harga_jual'    => 'required',
            'stok'          => 'required'
        ]);
        $validated = $validate->validated();
        try {
            $barang = Barang::create($validated);
            $barang->barangMasuk()->create(['jumlah' => $validated['stok']]);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Tambah Barang",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
    public function updateBarang(Barang $barang, Request $request)
    {
        $validate = Validator::make($request->all(), [
            'kategori_id'   => 'required',
            'supplier_id'   => 'required',
            'nama'          => 'required',
            'harga_beli'    => 'required',
            'harga_jual'    => 'required',
        ]);
        $validated = $validate->validated();
        try {
            $barang->update($validated);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Update Barang",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
    public function hapusBarang(Barang $barang)
    {
        try {
            $barang->delete();
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses hapus Barang",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
    public function tambahStok(Barang $barang, Request $request)
    {
        $validate = Validator::make($request->all(), [
            'stok'   => 'required',
        ]);
        $validated = $validate->validated();
        try {
            $barang->update(['stok' => DB::raw('stok +' . $validated['stok'])]);
            $barang->barangMasuk()->create([
                'jumlah' => $request->stok
            ]);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Tambah Stok Barang",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
}
