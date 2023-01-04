// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'kategori.g.dart';

@JsonSerializable(explicitToJson: true)
class Kategori {
  int kategori_id;
  String nama;
  // DateTime created_at;
  // DateTime updated_at;
  Kategori({
    required this.kategori_id,
    required this.nama,
  });
  factory Kategori.fromJson(Map<String, dynamic> json) =>
      _$KategoriFromJson(json);
  Map<String, dynamic> toJson() => _$KategoriToJson(this);
}
