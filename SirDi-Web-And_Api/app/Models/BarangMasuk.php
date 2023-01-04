<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangMasuk extends Model
{
    use HasFactory;
    protected $primaryKey = "barang_masuk_id";
    protected $guarded = ['barang_masuk_id'];
    public function scopeFilterTgl($query, array $data)
    {
        $query->when($data['from'] ?? null, function ($q, $from) {
            $q->whereDate('created_at', '>=', $from);
        });
        $query->when($data['to'] ?? null, function ($q, $to) {
            $q->whereDate('created_at', '<=', $to);
        });
        $query->when($data['kategori'] ?? null, function ($q, $kategori) {
            $q->whereHas('barang.kategori', function (Builder $query) use ($kategori) {
                $query->where('nama', '=', $kategori);
            });
        });
        return $query;
    }
    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
