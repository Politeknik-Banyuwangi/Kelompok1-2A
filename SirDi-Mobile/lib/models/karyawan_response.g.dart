// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karyawan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KaryawanResponse _$KaryawanResponseFromJson(Map<String, dynamic> json) =>
    KaryawanResponse(
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KaryawanResponseToJson(KaryawanResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
