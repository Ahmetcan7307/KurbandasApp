// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      fullName: json['fullName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    )..documentId = json['documentId'] as String?;

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'fullName': instance.fullName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
