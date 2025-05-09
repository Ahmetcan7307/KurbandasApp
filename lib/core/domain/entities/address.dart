import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  TurkiyeAPIProvince? province;
  TurkiyeAPIDistrict? district;
  String? cutAddress;

  Address({this.province, this.district, this.cutAddress});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$AddressToJson(this);
    json["province"] = province?.toJson();
    json["district"] = district?.toJson();

    return json;
  }

  bool get isComplete =>
      province != null && district != null && cutAddress != null;

  @override
  String toString() => "${province!.name} / ${district!.name} $cutAddress";
}
