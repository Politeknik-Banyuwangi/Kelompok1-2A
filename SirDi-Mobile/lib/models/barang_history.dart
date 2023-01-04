// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/kategori.dart';
import 'package:pbl_kasir/models/supplier.dart';
part 'barang_history.g.dart';

@JsonSerializable(explicitToJson: true)
class BarangHistory {
  String barang_id;
  int kategori_id;
  int supplier_id;
  String nama;
  int harga_beli;
  int harga_jual;
  DateTime created_at;
  DateTime updated_at;
  int stok;
  BarangHistory({
    required this.barang_id,
    required this.kategori_id,
    required this.supplier_id,
    required this.nama,
    required this.harga_beli,
    required this.harga_jual,
    required this.created_at,
    required this.updated_at,
    required this.stok,
  });
  factory BarangHistory.fromJson(Map<String, dynamic> json) =>
      _$BarangHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$BarangHistoryToJson(this);
}
