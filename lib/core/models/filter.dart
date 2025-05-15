import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';

class Filter {
  KurbanAnimal? animal;
  TurkiyeAPIProvince? selectedProvince;
  TurkiyeAPIDistrict? selectedDistrict;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    if (animal != null) {
      json["animal"] = animal!.documentId;
    }

    if (selectedProvince != null) {
      json["province"] = selectedProvince!.turkiyeAPIId;
    }

    if (selectedDistrict != null) {
      json["district"] = selectedDistrict!.turkiyeAPIId;
    }

    return json;
  }
}
