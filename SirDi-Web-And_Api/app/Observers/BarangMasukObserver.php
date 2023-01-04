<?php

namespace App\Observers;

use App\Models\BarangMasuk;
use Illuminate\Support\Facades\DB;

class BarangMasukObserver
{
    /**
     * Handle the BarangMasuk "created" event.
     *
     * @param  \App\Models\BarangMasuk  $barangMasuk
     * @return void
     */
    public function created(BarangMasuk $barangMasuk)
    {
        // $barangMasuk->barang->stok()->update([
        //     'jumlah' => DB::raw('jumlah + ' . $barangMasuk->jumlah)
        // ]);
    }

    /**
     * Handle the BarangMasuk "updated" event.
     *
     * @param  \App\Models\BarangMasuk  $barangMasuk
     * @return void
     */
    public function updated(BarangMasuk $barangMasuk)
    {
        //
    }

    /**
     * Handle the BarangMasuk "deleted" event.
     *
     * @param  \App\Models\BarangMasuk  $barangMasuk
     * @return void
     */
    public function deleted(BarangMasuk $barangMasuk)
    {
        //
    }

    /**
     * Handle the BarangMasuk "restored" event.
     *
     * @param  \App\Models\BarangMasuk  $barangMasuk
     * @return void
     */
    public function restored(BarangMasuk $barangMasuk)
    {
        //
    }

    /**
     * Handle the BarangMasuk "force deleted" event.
     *
     * @param  \App\Models\BarangMasuk  $barangMasuk
     * @return void
     */
    public function forceDeleted(BarangMasuk $barangMasuk)
    {
        //
    }
}
