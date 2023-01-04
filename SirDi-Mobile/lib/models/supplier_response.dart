// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/supplier.dart';
part 'supplier_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SupplierResponse {
  bool status;
  List<Supplier> data;
  SupplierResponse({
    required this.status,
    required this.data,
  });
  factory SupplierResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SupplierResponseToJson(this);
}
