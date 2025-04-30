import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'kurban.g.dart';

enum KurbanStatus { waiting, cut, shared }

@JsonSerializable()
class Kurban extends EntityBase {
  User? owner;
  KurbanAnimal animal;
  double? weight;
  double? price;
  KurbanStatus? status;
  DateTime? cutDate;
  String? address;
  int? totalPartnersCount;
  int? remainPartnersCount = 0;
  List<User>? partners;
  List<String>? photoUrls;

  Kurban(
      {this.owner,
      required this.animal,
      this.weight,
      this.price,
      this.status,
      this.cutDate,
      this.address,
      this.totalPartnersCount,
      this.partners,
      this.photoUrls}) {
    remainPartnersCount = totalPartnersCount;
  }

  factory Kurban.fromJson(Map<String, dynamic> json) => _$KurbanFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$KurbanToJson(this);
    json.clearNulls();
    return json;
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
