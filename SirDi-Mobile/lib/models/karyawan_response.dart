// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/user.dart';
part 'karyawan_response.g.dart';

@JsonSerializable(explicitToJson: true)
class KaryawanResponse {
  bool status;
  List<User> data;
  KaryawanResponse({
    required this.status,
    required this.data,
  });
  factory KaryawanResponse.fromJson(Map<String, dynamic> json) =>
      _$KaryawanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$KaryawanResponseToJson(this);
}
