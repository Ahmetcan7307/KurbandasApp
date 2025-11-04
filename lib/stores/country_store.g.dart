// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CountryStore on _CountryStore, Store {
  late final _$selectedCountryAtom =
      Atom(name: '_CountryStore.selectedCountry', context: context);

  @override
  CountryCode get selectedCountry {
    _$selectedCountryAtom.reportRead();
    return super.selectedCountry;
  }

  @override
  set selectedCountry(CountryCode value) {
    _$selectedCountryAtom.reportWrite(value, super.selectedCountry, () {
      super.selectedCountry = value;
    });
  }

  late final _$countryCodesAtom =
      Atom(name: '_CountryStore.countryCodes', context: context);

  @override
  List<CountryCode>? get countryCodes {
    _$countryCodesAtom.reportRead();
    return super.countryCodes;
  }

  @override
  set countryCodes(List<CountryCode>? value) {
    _$countryCodesAtom.reportWrite(value, super.countryCodes, () {
      super.countryCodes = value;
    });
  }

  late final _$getAsyncAction =
      AsyncAction('_CountryStore.get', context: context);

  @override
  Future<dynamic> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  late final _$_CountryStoreActionController =
      ActionController(name: '_CountryStore', context: context);

  @override
  void selectCountry(CountryCode countryCode) {
    final _$actionInfo = _$_CountryStoreActionController.startAction(
        name: '_CountryStore.selectCountry');
    try {
      return super.selectCountry(countryCode);
    } finally {
      _$_CountryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCountry: ${selectedCountry},
countryCodes: ${countryCodes}
    ''';
  }
}
