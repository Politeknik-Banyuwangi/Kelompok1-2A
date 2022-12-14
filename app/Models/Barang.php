<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;
    protected $primaryKey = 'barang_id';
    protected $guarded = [];
    protected $keyType = 'string';
    // public $incrementing = false;
    // protected $fillable = [
    //     'kategori_id',
    //     'barang_id',
    //     'supplier_id',
    //     'nama',
    //     'harga_beli',
    //     'harga_jual',
    //     'stok'
    // ];
    protected static function boot()
    {
        parent::boot();

        static::created(function ($model) {
            $model->barang_id = "PRODUCT_" . $model->id;
            $model->save();
        });
    }
    public function supplier()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }
    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id');
    }
    public function barangMasuk()
    {
        return $this->hasMany(BarangMasuk::class, 'barang_id');
    }
    public function historyTransaksi()
    {
        return $this->belongsToMany(HistoryTransaksi::class, 'barang_history_transaksis', 'barang_id', 'history_transaksi_id');
    }
}
