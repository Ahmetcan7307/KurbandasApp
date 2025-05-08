import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';
import 'package:kurbandas/core/domain/entities/address.dart';
import 'package:kurbandas/core/domain/entities/partner.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'kurban.g.dart';

enum KurbanStatus { waiting, cut, shared }

@JsonSerializable()
class Kurban extends EntityBase {
  User? owner;
  KurbanAnimal? animal;
  double? weight;
  double? price;
  KurbanStatus? status;
  DateTime? cutDate;
  String? addressStr; // null olamaz. Sadece create esnasında null olabilir
  Address? address;
  int? totalPartnersCount;
  int? remainPartnersCount = 0;
  List<Partner>? partners;
  List<String>? photoUrls;
  bool? isMy;

  Kurban(
      {this.owner,
      this.animal,
      this.weight,
      this.price,
      this.status,
      this.cutDate,
      this.addressStr,
      this.totalPartnersCount,
      this.partners,
      this.photoUrls,
      this.isMy,
      this.address}) {
    remainPartnersCount = totalPartnersCount;
  }

  factory Kurban.fromJson(Map<String, dynamic> json) => _$KurbanFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$KurbanToJson(this);
    json.clearNulls();
    return json;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Kurban &&
          runtimeType == other.runtimeType &&
          documentId == other.documentId;

  @override
  int get hashCode => totalPartnersCount.hashCode;

  bool get isComplete =>
      isBasicInfoComplete && address != null && address!.isComplete;

  bool get isBasicInfoComplete =>
      animal != null &&
      weight != null &&
      weight! > 0 &&
      price != null &&
      price! > 0 &&
      totalPartnersCount != null &&
      totalPartnersCount! > 0 &&
      totalPartnersCount! <= 7;

  clear() {
    animal = null;
    weight = null;
    price = null;
    cutDate = null;
    address = null;
    totalPartnersCount = null;
    remainPartnersCount = null;
  }
}

@JsonSerializable()
class KurbanAnimal extends EntityBase {
  String? name;

  KurbanAnimal({this.name});

  factory KurbanAnimal.fromJson(Map<String, dynamic> json) =>
      _$KurbanAnimalFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$KurbanAnimalToJson(this);
    json.clearNulls();
    return json;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KurbanAnimal &&
          runtimeType == other.runtimeType &&
          documentId == other.documentId;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => name ?? "";
}
