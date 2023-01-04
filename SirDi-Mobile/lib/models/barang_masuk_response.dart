// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/barang_masuk.dart';
part 'barang_masuk_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BarangMasukResponse {
  bool status;
  List<BarangMasuk> data;
  BarangMasukResponse({
    required this.status,
    required this.data,
  });
  factory BarangMasukResponse.fromJson(Map<String, dynamic> json) =>
      _$BarangMasukResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BarangMasukResponseToJson(this);
}
