<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use Illuminate\Support\Facades\DB;
use App\Models\BarangHistoryTransaksi;
use App\Models\BarangMasuk;
use App\Models\HistoryTransaksi;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class HistoryTransaksiController extends Controller
{
    public function index()
    {
        // return view('transaksi.index');
        $barangs = Barang::latest()->get();

        return view('transaksi.index', compact('barangs'));
    }
    public function search(Request $request)
    {
        if ($request->ajax()) {
            $output = "";
            $barangs = Barang::where('nama', 'like', "%" . $request->search . "%")
                ->orWhere('barang_id', 'like', "%" . $request->search . "%")
                ->paginate(5);
            // $barangs = DB::table('barangs')->where('nama', 'LIKE', '%' . $request->search . "%")->get();

            if ($barangs) {
                $no = 1;
                foreach ($barangs as  $barang) {
                    $output .= '<tr id="' . $no++ . '">' .
                        '<td class="row-data" >' . $barang->barang_id . '</td>' .
                        '<td class="row-data">' . $barang->nama . '</td>' .
                        '<td class="row-data">' . $barang->harga_jual . '</td>' .
                        '<td class="row-data">' . $barang->stok . '</td>' .
                        '<td><button class="btn btn-galang ms-auto me-auto"
                        onclick="tambahKeranjang(), disableButton(this)">Tambah</button></td>' .
                        '</tr>';
                }
                return Response($output);
            }
        }
    }
    public function transaksi(Request $request)
    {

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
                'message' => "Sukses Melakukan Transaksi",
                'data' => $request->data
            ]);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json([
                'status' => false,
                'message' => $e->getMessage()
            ]);
        }
    }
    function getHistory(Request $request)
    {
        // $history = HistoryTransaksi::with('barang')->get();
        // return view('transaksi.history', compact('history'))->with('i', (request()->input('page', 1) - 1) * 5,);
        $tanggal_mulai = $request->input('tanggal_mulai');
        $tanggal_akhir = $request->input('tanggal_akhir');
        $tanggal_mulai = Carbon::parse($tanggal_mulai)->toDateString();
        $tanggal_akhir = Carbon::parse($tanggal_akhir)->toDateString();


        // ambil data dari database
        // $history = HistoryTransaksi::with('barang')->when($tanggal_mulai, function ($query) use ($tanggal_mulai, $tanggal_akhir) {
        //     return $query->whereBetween('created_at', [$tanggal_mulai, $tanggal_akhir]);
        // })
        //     ->get();
        $history = HistoryTransaksi::with(['barang' => function ($q) {
            $q->withTrashed();
        }])->orderBy('created_at', 'DESC')->get();
        // $history = $history->whereBetween('created_at', [$tanggal_mulai . ' 00:00:00', $tanggal_akhir . ' 23:59:59']);

        // jika tanggal mulai dan tanggal akhir ditentukan, lakukan filter data
        if ($tanggal_mulai && $tanggal_akhir) {
            $history = $history->whereBetween('created_at', [$tanggal_mulai . ' 00:00:00', $tanggal_akhir . ' 23:59:59']);
        } else if ($tanggal_mulai && $tanggal_akhir == null) {
            $history = HistoryTransaksi::with('barang')->orderBy('created_at', 'DESC')->get();
        }

        // tampilkan data di view
        return view('transaksi.history', compact('history', 'tanggal_mulai', 'tanggal_akhir'))->with('i', (request()->input('page', 1) - 1) * 5,);
    }
}
