import 'package:kurbandas/core/domain/entities/kurban.dart';

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
}
