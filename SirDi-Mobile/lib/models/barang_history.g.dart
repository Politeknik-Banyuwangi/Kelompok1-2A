// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarangHistory _$BarangHistoryFromJson(Map<String, dynamic> json) =>
    BarangHistory(
      barang_id: json['barang_id'] as String,
      kategori_id: json['kategori_id'] as int,
      supplier_id: json['supplier_id'] as int,
      nama: json['nama'] as String,
      harga_beli: json['harga_beli'] as int,
      harga_jual: json['harga_jual'] as int,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      stok: json['stok'] as int,
    );

Map<String, dynamic> _$BarangHistoryToJson(BarangHistory instance) =>
    <String, dynamic>{
      'barang_id': instance.barang_id,
      'kategori_id': instance.kategori_id,
      'supplier_id': instance.supplier_id,
      'nama': instance.nama,
      'harga_beli': instance.harga_beli,
      'harga_jual': instance.harga_jual,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'stok': instance.stok,
    };
