import 'package:kurbandas/core/domain/entities/country_code.dart';

class CountryService {
  static List<CountryCode> getAll = ([
    {
      "documentId": "s0qz2psj7ze0awz9re3aagmw",
      "code": "+90",
      "country": "TR 🇹🇷",
      "pattern": "5[0-9]{9}",
      "example": "5XX XXX XX XX"
    },
    {
      "documentId": "zr8l6v424r8t9obf1kd6abi2",
      "code": "+1",
      "country": "US 🇺🇸",
      "pattern": "[2-9][0-9]{9}",
      "example": "XXX XXX XXXX"
    },
    {
      "documentId": "e1ezillyjqfmyc325sd0676v",
      "code": "+49",
      "country": "DE 🇩🇪",
      "pattern": "1[5-7][0-9]{8}",
      "example": "15XX XXXXXXX"
    },
    {
      "documentId": "l8pcpcc3g8yogghxfys74n2e",
      "code": "+33",
      "country": "FR 🇫🇷",
      "pattern": "[67][0-9]{8}",
      "example": "6XX XX XX XX"
    },
    {
      "documentId": "wliets021uq4lc2ixb0yq6zj",
      "code": "+966",
      "country": "SA 🇸🇦",
      "pattern": "5[0-9]{8}",
      "example": "5XX XXX XXXX"
    },
    {
      "documentId": "h3mqooh0v16i7hrw4h55gybr",
      "code": "+971",
      "country": "AE 🇦🇪",
      "pattern": "5[0-9]{8}",
      "example": "5X XXX XXXX"
    },
    {
      "documentId": "gc0bqxqst9k47u6iy77hihx3",
      "code": "+44",
      "country": "GB 🇬🇧",
      "pattern": "7[0-9]{9}",
      "example": "7XXX XXXXXX"
    }
  ]).map((data) => CountryCode.fromJson(data)).toList();
}
