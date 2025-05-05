import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';

part 'partner.g.dart';

@JsonSerializable()
class Partner extends EntityBase {
  String fullName;
  DateTime createdAt;

  Partner({required this.fullName, required this.createdAt});

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}
