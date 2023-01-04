<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    use HasFactory;
    protected $primaryKey = "kategori_id";
    protected $guarded = ['kategori_id'];
    protected $fillable = ['nama'];
    public function barang()
    {
        return $this->hasOne(Barang::class, 'kategori_id');
    }
}
