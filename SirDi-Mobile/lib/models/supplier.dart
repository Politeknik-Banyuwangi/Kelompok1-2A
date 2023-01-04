// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'supplier.g.dart';

@JsonSerializable(explicitToJson: true)
class Supplier {
  int supplier_id;
  String nama_supplier;
  // DateTime created_at;
  // DateTime updated_at;
  Supplier({
    required this.supplier_id,
    required this.nama_supplier,
  });
  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);
  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}
