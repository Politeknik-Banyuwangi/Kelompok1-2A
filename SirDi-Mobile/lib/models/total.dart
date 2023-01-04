// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'total.g.dart';

@JsonSerializable(explicitToJson: true)
class TotalHariIni {
  bool status;
  int penjualan;
  TotalHariIni({required this.status, required this.penjualan});
  factory TotalHariIni.fromJson(Map<String, dynamic> json) =>
      _$TotalHariIniFromJson(json);
  Map<String, dynamic> toJson() => _$TotalHariIniToJson(this);
}
