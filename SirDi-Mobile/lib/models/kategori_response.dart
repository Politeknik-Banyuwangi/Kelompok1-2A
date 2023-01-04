// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/kategori.dart';
part 'kategori_response.g.dart';

@JsonSerializable(explicitToJson: true)
class KategoriResponse {
  bool status;
  List<Kategori> data;
  KategoriResponse({
    required this.status,
    required this.data,
  });
  factory KategoriResponse.fromJson(Map<String, dynamic> json) =>
      _$KategoriResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KategoriResponseToJson(this);
}
