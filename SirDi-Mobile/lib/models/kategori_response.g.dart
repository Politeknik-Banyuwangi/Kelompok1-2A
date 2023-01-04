// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KategoriResponse _$KategoriResponseFromJson(Map<String, dynamic> json) =>
    KategoriResponse(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Kategori.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KategoriResponseToJson(KategoriResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
