<?php

namespace App\Observers;

use App\Models\Stok;

class StokObserver
{
    /**
     * Handle the Stok "created" event.
     *
     * @param  \App\Models\Stok  $stok
     * @return void
     */
    public function created(Stok $stok)
    {
        //
    }
    public function creating(Stok $stok)
    {
        $stok->barang->barangMasuk()->create([
            'barang_id' => $stok->barang_id,
            'jumlah'    =>  $stok->jumlah
        ]);
    }
    /**
     * Handle the Stok "updated" event.
     *
     * @param  \App\Models\Stok  $stok
     * @return void
     */
    public function updated(Stok $stok)
    {
        //
    }

    /**
     * Handle the Stok "deleted" event.
     *
     * @param  \App\Models\Stok  $stok
     * @return void
     */
    public function deleted(Stok $stok)
    {
        //
    }

    /**
     * Handle the Stok "restored" event.
     *
     * @param  \App\Models\Stok  $stok
     * @return void
     */
    public function restored(Stok $stok)
    {
        //
    }

    /**
     * Handle the Stok "force deleted" event.
     *
     * @param  \App\Models\Stok  $stok
     * @return void
     */
    public function forceDeleted(Stok $stok)
    {
        //
    }
}
