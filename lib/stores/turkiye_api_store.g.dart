// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turkiye_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TurkiyeAPIStore on _TurkiyeAPIStore, Store {
  late final _$provincesAtom =
      Atom(name: '_TurkiyeAPIStore.provinces', context: context);

  @override
  List<TurkiyeAPIProvince>? get provinces {
    _$provincesAtom.reportRead();
    return super.provinces;
  }

  @override
  set provinces(List<TurkiyeAPIProvince>? value) {
    _$provincesAtom.reportWrite(value, super.provinces, () {
      super.provinces = value;
    });
  }

  late final _$districtsAtom =
      Atom(name: '_TurkiyeAPIStore.districts', context: context);

  @override
  List<TurkiyeAPIDistrict>? get districts {
    _$districtsAtom.reportRead();
    return super.districts;
  }

  @override
  set districts(List<TurkiyeAPIDistrict>? value) {
    _$districtsAtom.reportWrite(value, super.districts, () {
      super.districts = value;
    });
  }

  late final _$getProvinceAsyncAction =
      AsyncAction('_TurkiyeAPIStore.getProvince', context: context);

  @override
  Future<dynamic> getProvince() {
    return _$getProvinceAsyncAction.run(() => super.getProvince());
  }

  late final _$selectProvinceAsyncAction =
      AsyncAction('_TurkiyeAPIStore.selectProvince', context: context);

  @override
  Future<dynamic> selectProvince(int id) {
    return _$selectProvinceAsyncAction.run(() => super.selectProvince(id));
  }

  @override
  String toString() {
    return '''
provinces: ${provinces},
districts: ${districts}
    ''';
  }
}
