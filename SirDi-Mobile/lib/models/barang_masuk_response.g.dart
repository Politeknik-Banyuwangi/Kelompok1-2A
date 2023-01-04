// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang_masuk_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarangMasukResponse _$BarangMasukResponseFromJson(Map<String, dynamic> json) =>
    BarangMasukResponse(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => BarangMasuk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BarangMasukResponseToJson(
        BarangMasukResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
