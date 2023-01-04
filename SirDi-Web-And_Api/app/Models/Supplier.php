<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;
    protected $primaryKey = "supplier_id";
    protected $guarded = ['supplier_id'];
    protected $fillable = ['nama_supplier'];

    public function barang()
    {
        return $this->hasMany(Barang::class, 'supplier_id');
    }
}
