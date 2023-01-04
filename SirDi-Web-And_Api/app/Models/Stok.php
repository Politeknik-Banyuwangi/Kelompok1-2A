<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stok extends Model
{
    use HasFactory;
    protected $primaryKey = "stok_id";
    protected $guarded = ['stok_id'];
    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
