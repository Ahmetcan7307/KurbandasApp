// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turkiye_api_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurkiyeAPIProvince _$TurkiyeAPIProvinceFromJson(Map<String, dynamic> json) =>
    TurkiyeAPIProvince(
      turkiyeAPIId: (json['turkiyeAPIId'] as num).toInt(),
      name: json['name'] as String,
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => TurkiyeAPIDistrict.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TurkiyeAPIProvinceToJson(TurkiyeAPIProvince instance) =>
    <String, dynamic>{
      'turkiyeAPIId': instance.turkiyeAPIId,
      'name': instance.name,
      'districts': instance.districts,
    };
