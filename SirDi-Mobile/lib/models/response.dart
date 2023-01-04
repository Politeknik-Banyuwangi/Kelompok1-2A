import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/barang.dart';
part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  bool status;
  List<Barang> data;
  Response({
    required this.status,
    required this.data,
  });
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
