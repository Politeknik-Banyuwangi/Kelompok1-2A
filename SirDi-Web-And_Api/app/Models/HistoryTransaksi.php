<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryTransaksi extends Model
{
    use HasFactory;
    protected $primaryKey = "history_transaksi_id";
    protected $guarded = [];
    protected $fillable = ['user_id', 'jumlah', 'total', 'laba'];
    protected $table = "history_transaksis";
    public function barang()
    {
        return $this->belongsToMany(Barang::class, 'barang_history_transaksis', 'history_transaksi_id', 'barang_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
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
}
