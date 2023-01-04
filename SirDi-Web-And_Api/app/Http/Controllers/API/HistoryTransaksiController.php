<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Barang;
use App\Models\BarangHistoryTransaksi;
use App\Models\BarangMasuk;
use App\Models\HistoryTransaksi;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HistoryTransaksiController extends Controller
{
    public function index()
    {
        $data = [
            'from' => request('from') != null ? Carbon::parse(request('from'))->toDateString() : null,
            'to' => request('to') != null ? Carbon::parse(request('to'))->toDateString() : null,
            'kategori' => request('kategori') ?? null
        ];
        $history = HistoryTransaksi::with(['barang' => function ($q) {
            $q->withTrashed();
        }, 'user' => function ($q) {
            $q->withTrashed();
        }])->filterTgl($data)->orderBy('created_at', 'DESC')->get();
        return response()->json([
            'status' => true,
            'laba' => $history->map(function ($item) {
                return $item->laba;
            })->sum(),
            'penjualan' => $history->map(function ($item) {
                return $item->total;
            })->sum(),
            'data'  => $history,
        ]);
    }
    public function totalHariIni()
    {
        $history = HistoryTransaksi::with(['barang' => function ($q) {
            $q->withTrashed();
        }])->whereDate('created_at', '=', Carbon::today()->toDateString())->get();
        return response()->json([
            'status'    => true,
            'penjualan' => $history->map(function ($item) {
                return $item->total;
            })->sum(),
        ]);
    }
    public function hariIni()
    {
        $history = HistoryTransaksi::with(['barang' => function ($q) {
            $q->withTrashed();
        }, 'user' => function ($q) {
            $q->withTrashed();
        }])->whereDate('created_at', '=', Carbon::today()->toDateString())->get();
        return response()->json([
            'status' => true,
            'laba'  => $history->map(function ($item) {
                return $item->laba;
            })->sum(),
            'penjualan' => $history->map(function ($item) {
                return $item->total;
            })->sum(),
            'data'  => $history,
        ]);
    }
    public function barangMasuk()
    {
        $data = [
            'from' => request('from') != null ? Carbon::parse(request('from'))->toDateString() : null,
            'to' => request('to') != null ? Carbon::parse(request('to'))->toDateString() : null,
            'kategori' => request('kategori') ?? null
        ];
        return response()->json([
            'status'    =>  true,
            'data'  => BarangMasuk::with(['barang' => function ($q) {
                $q->withTrashed();
            }])->filterTgl($data)->orderBy('created_at', 'DESC')->get()
        ]);
    }
    public function transaksi(Request $request)
    {
        /*
        format request
        {
            "data":[
            {
                "barang_id":10,
                "jumlah":10
            },
            {
                "barang_id":11,
                "jumlah":10
            }]
        }
        */

        $barangId = [];
        $barangJumlah = [];
        foreach ($request->data as $item) {
            $barangId[] = $item['barang_id'];
            $barangJumlah[] = $item['jumlah'];
        }
        DB::beginTransaction();
        try {
            $barang = Barang::whereIn('barang_id', $barangId)->get();
            foreach ($barang as $key => $value) {
                $history = new HistoryTransaksi();
                $history->user_id = Auth::user()->id;
                $history->jumlah = $barangJumlah[$key];
                $history->total = $value->harga_jual * $barangJumlah[$key];
                $history->laba = ($value->harga_jual * $barangJumlah[$key]) - ($value->harga_beli * $barangJumlah[$key]);
                $history->save();
                $history->barang()->attach($barangId[$key]);
                $value->stok = $value->stok - $barangJumlah[$key];
                $value->save();
            }
            DB::commit();
            return response()->json([
                'status' => true,
                'message' => "Sukses Melakukan Transaksi"
            ]);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json([
                'status' => false,
                'message' => $e->getMessage()
            ]);
        }
    }
}
