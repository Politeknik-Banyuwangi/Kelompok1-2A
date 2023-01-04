<?php

namespace App\Http\Controllers;

use app\Models\Barang;
use Illuminate\Http\Request;
use app\Models\HistoryTransaksi;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $barang = Barang::latest()->get();
        $totalBarang = $barang->count();
        // $history_transaksi = HistoryTransaksi::count();
        // $history_transaksi = DB::table('history_transaksis')->count();
        $history_transaksi = DB::table('history_transaksis')
            ->whereDate('created_at', '=', Carbon::today())
            ->count();
        $total_today = DB::table('history_transaksis')->whereDate('created_at', '=', Carbon::today())
            ->sum('total');
        $laba_today = DB::table('history_transaksis')->whereDate('created_at', '=', Carbon::today())
            ->sum('laba');

        return view('home', compact('totalBarang',  'history_transaksi', 'total_today', 'laba_today',));
    }
}
