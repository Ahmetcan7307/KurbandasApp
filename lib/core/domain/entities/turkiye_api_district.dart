import 'package:json_annotation/json_annotation.dart';

part 'turkiye_api_district.g.dart';

@JsonSerializable(createToJson: false)
class TurkiyeAPIDistrict {
  int id;
  String name;

  TurkiyeAPIDistrict({required this.id, required this.name});

  factory TurkiyeAPIDistrict.fromJson(Map<String, dynamic> json) =>
      _$TurkiyeAPIDistrictFromJson(json);
}
