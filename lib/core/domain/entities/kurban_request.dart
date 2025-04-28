import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'kurban_request.g.dart';

enum KurbanRequestState { waiting, approved }

@JsonSerializable()
class KurbanRequest extends EntityBase {
  User user;
  String? kurbanDocumentId;
  DateTime createdAt;
  KurbanRequestState state;

  KurbanRequest(
      {required this.user,
      required this.createdAt,
      required this.state,
      this.kurbanDocumentId});

  factory KurbanRequest.fromJson(Map<String, dynamic> json) =>
      _$KurbanRequestFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$KurbanRequestToJson(this);
    json.clearNulls();
    return json;
  }
}
