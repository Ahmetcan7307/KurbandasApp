import 'package:json_annotation/json_annotation.dart';

part 'turkiye_api_district.g.dart';

@JsonSerializable(createToJson: false)
class TurkiyeAPIDistrict {
  int id;
  String name;

  TurkiyeAPIDistrict(this.id, this.name);

  factory TurkiyeAPIDistrict.fromJson(Map<String, dynamic> json) =>
      _$TurkiyeAPIDistrictFromJson(json);
}
