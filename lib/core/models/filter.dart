import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';

class Filter {
  KurbanAnimal? animal;
  TurkiyeAPIProvince? selectedProvince;
  TurkiyeAPIDistrict? selectedDistrict;
}
