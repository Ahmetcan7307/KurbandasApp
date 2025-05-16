import 'package:kurbandas/core/domain/entities/country_code.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/apis/my_api/country_service.dart';
import 'package:kurbandas/services/string_service.dart';
import 'package:mobx/mobx.dart';

part 'country_store.g.dart';

class CountryStore = _CountryStore with _$CountryStore;

abstract class _CountryStore with Store {
  @observable
  CountryCode selectedCountry = CountryCode(
      code: "+90",
      country: "TR 🇹🇷",
      pattern: "^5[0-9]{9}\$",
      example: "5XX XXX XX XX")
    ..documentId = "s0qz2psj7ze0awz9re3aagmw";

  @observable
  List<CountryCode>? countryCodes;

  final CountryService service = serviceLocator.get<CountryService>();
  final StringService stringService = serviceLocator.get<StringService>();

  @action
  selectCountry(CountryCode countryCode) => selectedCountry = countryCode;

  @action
  Future get() async => countryCodes = await service.getAll();

  String formatPhoneNumber(String phone, String countryCode) =>
      stringService.formatPhoneNumber(phone, countryCode);
}
