// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      history_transaksi_id: json['history_transaksi_id'] as int,
      user_id: json['user_id'] as int,
      jumlah: json['jumlah'] as int,
      total: json['total'] as int,
      laba: json['laba'] as int,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      barang: (json['barang'] as List<dynamic>)
          .map((e) => BarangHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'history_transaksi_id': instance.history_transaksi_id,
      'user_id': instance.user_id,
      'jumlah': instance.jumlah,
      'total': instance.total,
      'laba': instance.laba,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'barang': instance.barang.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
    };
