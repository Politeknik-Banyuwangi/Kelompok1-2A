// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/kategori.dart';
import 'package:pbl_kasir/models/supplier.dart';
part 'barang.g.dart';

@JsonSerializable(explicitToJson: true)
class Barang {
  String barang_id;
  int kategori_id;
  String nama;
  int harga_beli;
  int harga_jual;
  // DateTime created_at;
  // DateTime updated_at;
  int stok;
  Kategori kategori;
  Supplier supplier;
  Barang({
    required this.barang_id,
    required this.kategori_id,
    required this.nama,
    required this.harga_beli,
    required this.harga_jual,
    required this.stok,
    required this.kategori,
    required this.supplier,
  });
  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);
  Map<String, dynamic> toJson() => _$BarangToJson(this);
}
