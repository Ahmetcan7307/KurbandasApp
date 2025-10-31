// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      accessToken: json['accessToken'] as String?,
      token: json['token'] as String?,
      idToken: json['idToken'] as String?,
      fromGoogle: json['fromGoogle'] as bool?,
    )..documentId = json['documentId'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'token': instance.token,
      'phoneNo': instance.phoneNo,
      'accessToken': instance.accessToken,
      'idToken': instance.idToken,
      'fromGoogle': instance.fromGoogle,
    };
