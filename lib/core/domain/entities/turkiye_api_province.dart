import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'turkiye_api_province.g.dart';

@JsonSerializable()
class TurkiyeAPIProvince {
  int turkiyeAPIId;
  String name;
  List<TurkiyeAPIDistrict>? districts;

  TurkiyeAPIProvince(
      {required this.turkiyeAPIId, required this.name, this.districts});

  factory TurkiyeAPIProvince.fromJson(Map<String, dynamic> json) =>
      _$TurkiyeAPIProvinceFromJson(json);

  Map<String, dynamic> toJson() {
    districts = null;
    Map<String, dynamic> json = _$TurkiyeAPIProvinceToJson(this);
    json.clearNulls();
    return json;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TurkiyeAPIProvince &&
          runtimeType == other.runtimeType &&
          turkiyeAPIId == other.turkiyeAPIId;

  @override
  int get hashCode => turkiyeAPIId.hashCode;
}
