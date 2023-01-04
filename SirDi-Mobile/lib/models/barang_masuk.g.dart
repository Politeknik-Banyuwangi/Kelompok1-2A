// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang_masuk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarangMasuk _$BarangMasukFromJson(Map<String, dynamic> json) => BarangMasuk(
      barang_masuk_id: json['barang_masuk_id'] as int,
      barang_id: json['barang_id'] as String,
      jumlah: json['jumlah'] as int,
      barang: BarangHistory.fromJson(json['barang'] as Map<String, dynamic>),
      created_at: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BarangMasukToJson(BarangMasuk instance) =>
    <String, dynamic>{
      'barang_masuk_id': instance.barang_masuk_id,
      'barang_id': instance.barang_id,
      'jumlah': instance.jumlah,
      'created_at': instance.created_at.toIso8601String(),
      'barang': instance.barang.toJson(),
    };
