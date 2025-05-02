import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';

part 'turkiye_api_province.g.dart';

@JsonSerializable(createToJson: false)
class TurkiyeAPIProvince {
  int id;
  String name;
  List<TurkiyeAPIDistrict>? districts;

  TurkiyeAPIProvince({required this.id, required this.name, this.districts});

  factory TurkiyeAPIProvince.fromJson(Map<String, dynamic> json) =>
      _$TurkiyeAPIProvinceFromJson(json);
}
