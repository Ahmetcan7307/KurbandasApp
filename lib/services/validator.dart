import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';

class Validator {
  static String? checkKurbanAnimal(KurbanAnimal? animal, String message) {
    if (animal == null) {
      return message;
    }

    return null;
  }

  static String? checkDouble(
      String? doubleValue, String pleaseMessage, String validMessage) {
    if (doubleValue == null || doubleValue.isEmpty) {
      return pleaseMessage;
    }
    if (double.tryParse(doubleValue) == null ||
        double.parse(doubleValue) <= 0) {
      return validMessage;
    }

    return null;
  }

  static String? checkKurbanTotalPartnersCount(
      String? totalPartnersCountStr,
      String pleaseMessage,
      String validMessage,
      String maxPartnersCountMessage) {
    if (totalPartnersCountStr == null || totalPartnersCountStr.isEmpty) {
      return pleaseMessage;
    }
    int? totalPartnersCount = int.tryParse(totalPartnersCountStr);
    if (totalPartnersCount == null || totalPartnersCount <= 0) {
      return validMessage;
    }
    if (totalPartnersCount > 7) {
      return maxPartnersCountMessage;
    }

    return null;
  }

  static String? checkProvince(
      TurkiyeAPIProvince? province, String pleaseMessage) {
    if (province == null) {
      return pleaseMessage;
    }

    return null;
  }

  static String? checkCutAddress(String? cutAddress, String pleaseMessage) {
    if (cutAddress == null || cutAddress.isEmpty) {
      return pleaseMessage;
    }

    return null;
  }

  static String? checkDistrict(
      TurkiyeAPIDistrict? district, String pleaseMessage) {
    if (district == null) {
      return pleaseMessage;
    }

    return null;
  }

  static String? checkString(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
