import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/kategori.dart';
import 'package:pbl_kasir/models/supplier.dart';
part 'barang_transaksi.g.dart';

@JsonSerializable(explicitToJson: true)
class BarangTransaksi {
  String barang_id;
  String nama;
  int harga_jual;
  int stok;
  int jumlah;
  int total;
  BarangTransaksi({
    required this.barang_id,
    required this.nama,
    required this.harga_jual,
    required this.stok,
    required this.jumlah,
    required this.total,
  });
  factory BarangTransaksi.fromJson(Map<String, dynamic> json) =>
      _$BarangTransaksiFromJson(json);
  Map<String, dynamic> toJson() => _$BarangTransaksiToJson(this);
}
