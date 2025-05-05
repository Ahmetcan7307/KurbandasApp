// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kurban.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kurban _$KurbanFromJson(Map<String, dynamic> json) => Kurban(
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      animal: KurbanAnimal.fromJson(json['animal'] as Map<String, dynamic>),
      weight: (json['weight'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      status: $enumDecodeNullable(_$KurbanStatusEnumMap, json['status']),
      cutDate: json['cutDate'] == null
          ? null
          : DateTime.parse(json['cutDate'] as String),
      address: json['address'] as String?,
      totalPartnersCount: (json['totalPartnersCount'] as num?)?.toInt(),
      partners: (json['partners'] as List<dynamic>?)
          ?.map((e) => Partner.fromJson(e as Map<String, dynamic>))
          .toList(),
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isMy: json['isMy'] as bool?,
    )
      ..documentId = json['documentId'] as String?
      ..remainPartnersCount = (json['remainPartnersCount'] as num?)?.toInt();

Map<String, dynamic> _$KurbanToJson(Kurban instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'owner': instance.owner,
      'animal': instance.animal,
      'weight': instance.weight,
      'price': instance.price,
      'status': _$KurbanStatusEnumMap[instance.status],
      'cutDate': instance.cutDate?.toIso8601String(),
      'address': instance.address,
      'totalPartnersCount': instance.totalPartnersCount,
      'remainPartnersCount': instance.remainPartnersCount,
      'partners': instance.partners,
      'photoUrls': instance.photoUrls,
      'isMy': instance.isMy,
    };

const _$KurbanStatusEnumMap = {
  KurbanStatus.waiting: 'waiting',
  KurbanStatus.cut: 'cut',
  KurbanStatus.shared: 'shared',
};

KurbanAnimal _$KurbanAnimalFromJson(Map<String, dynamic> json) => KurbanAnimal(
      name: json['name'] as String?,
    )..documentId = json['documentId'] as String?;

Map<String, dynamic> _$KurbanAnimalToJson(KurbanAnimal instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
    };
