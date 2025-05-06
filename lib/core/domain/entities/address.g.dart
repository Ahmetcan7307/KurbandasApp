// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      province: json['province'] == null
          ? null
          : TurkiyeAPIProvince.fromJson(
              json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : TurkiyeAPIDistrict.fromJson(
              json['district'] as Map<String, dynamic>),
      cutAddress: json['cutAddress'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'cutAddress': instance.cutAddress,
    };
