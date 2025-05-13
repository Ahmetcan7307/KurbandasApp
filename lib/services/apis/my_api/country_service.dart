import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/country_code.dart';

class CountryService {
  final Dio dio;

  CountryService(this.dio);

  Future<List<CountryCode>> get() async => await Future.value([
        {
          "documentId": "1",
          "code": "+90",
          "country": "TR 🇹🇷",
          "pattern": "5[0-9]{9}",
          "example": "5XX XXX XX XX"
        },
        {
          "documentId": "2",
          "code": "+1",
          "country": "US 🇺🇸",
          "pattern": "[2-9][0-9]{9}",
          "example": "XXX XXX XXXX"
        },
        {
          "documentId": "3",
          "code": "+44",
          "country": "GB 🇬🇧",
          "pattern": "7[0-9]{9}",
          "example": "7XXX XXXXXX"
        },
        {
          "documentId": "4",
          "code": "+49",
          "country": "DE 🇩🇪",
          "pattern": "1[5-7][0-9]{8}",
          "example": "15XX XXXXXXX"
        },
        {
          "documentId": "5",
          "code": "+33",
          "country": "FR 🇫🇷",
          "pattern": "[67][0-9]{8}",
          "example": "6XX XX XX XX"
        },
        {
          "documentId": "6",
          "code": "+966",
          "country": "SA 🇸🇦",
          "pattern": "5[0-9]{8}",
          "example": "5XX XXX XXXX"
        },
        {
          "documentId": "7",
          "code": "+971",
          "country": "AE 🇦🇪",
          "pattern": "5[0-9]{8}",
          "example": "5X XXX XXXX"
        },
      ].map((countryCodeMap) => CountryCode.fromJson(countryCodeMap)).toList());
}
