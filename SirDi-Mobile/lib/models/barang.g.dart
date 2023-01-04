// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barang _$BarangFromJson(Map<String, dynamic> json) => Barang(
      barang_id: json['barang_id'] as String,
      kategori_id: json['kategori_id'] as int,
      nama: json['nama'] as String,
      harga_beli: json['harga_beli'] as int,
      harga_jual: json['harga_jual'] as int,
      stok: json['stok'] as int,
      kategori: Kategori.fromJson(json['kategori'] as Map<String, dynamic>),
      supplier: Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'barang_id': instance.barang_id,
      'kategori_id': instance.kategori_id,
      'nama': instance.nama,
      'harga_beli': instance.harga_beli,
      'harga_jual': instance.harga_jual,
      'stok': instance.stok,
      'kategori': instance.kategori.toJson(),
      'supplier': instance.supplier.toJson(),
    };
