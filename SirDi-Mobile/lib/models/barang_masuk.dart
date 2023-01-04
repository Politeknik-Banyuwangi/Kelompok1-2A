// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/barang.dart';
import 'package:pbl_kasir/models/barang_history.dart';
part 'barang_masuk.g.dart';

@JsonSerializable(explicitToJson: true)
class BarangMasuk {
  int barang_masuk_id;
  String barang_id;
  int jumlah;
  DateTime created_at;
  BarangHistory barang;
  BarangMasuk({
    required this.barang_masuk_id,
    required this.barang_id,
    required this.jumlah,
    required this.barang,
    required this.created_at,
  });
  factory BarangMasuk.fromJson(Map<String, dynamic> json) =>
      _$BarangMasukFromJson(json);
  Map<String, dynamic> toJson() => _$BarangMasukToJson(this);
}
