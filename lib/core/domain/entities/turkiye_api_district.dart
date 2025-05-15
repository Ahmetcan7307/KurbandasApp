import 'package:json_annotation/json_annotation.dart';

part 'turkiye_api_district.g.dart';

@JsonSerializable()
class TurkiyeAPIDistrict {
  int turkiyeAPIId;
  String name;

  TurkiyeAPIDistrict({required this.turkiyeAPIId, required this.name});

  factory TurkiyeAPIDistrict.fromJson(Map<String, dynamic> json) {
    // Turkiye API için
    if (json.containsKey("id")) {
      json["turkiyeAPIId"] = json["id"];
    }

    return _$TurkiyeAPIDistrictFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TurkiyeAPIDistrictToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TurkiyeAPIDistrict &&
          runtimeType == other.runtimeType &&
          turkiyeAPIId == other.turkiyeAPIId;

  @override
  int get hashCode => turkiyeAPIId.hashCode;
}
