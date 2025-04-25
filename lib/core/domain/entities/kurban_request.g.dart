// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kurban_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KurbanRequest _$KurbanRequestFromJson(Map<String, dynamic> json) =>
    KurbanRequest(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      state: $enumDecode(_$KurbanRequestStateEnumMap, json['state']),
      kurbanDocumentId: json['kurbanDocumentId'] as String?,
    )..documentId = json['documentId'] as String?;

Map<String, dynamic> _$KurbanRequestToJson(KurbanRequest instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'user': instance.user,
      'kurbanDocumentId': instance.kurbanDocumentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'state': _$KurbanRequestStateEnumMap[instance.state]!,
    };

const _$KurbanRequestStateEnumMap = {
  KurbanRequestState.waiting: 'waiting',
  KurbanRequestState.approved: 'approved',
};
