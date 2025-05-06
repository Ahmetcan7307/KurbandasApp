import 'package:json_annotation/json_annotation.dart';

part 'turkiye_api_district.g.dart';

@JsonSerializable()
class TurkiyeAPIDistrict {
  int id;
  String name;

  TurkiyeAPIDistrict({required this.id, required this.name});

  factory TurkiyeAPIDistrict.fromJson(Map<String, dynamic> json) =>
      _$TurkiyeAPIDistrictFromJson(json);

  Map<String, dynamic> toJson() => _$TurkiyeAPIDistrictToJson(this);
}
