// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    HistoryResponse(
      status: json['status'] as bool,
      laba: json['laba'] as int,
      penjualan: json['penjualan'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryResponseToJson(HistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'laba': instance.laba,
      'penjualan': instance.penjualan,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
