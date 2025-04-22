// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kurban_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KurbanStore on _KurbanStore, Store {
  late final _$animalsAtom =
      Atom(name: '_KurbanStore.animals', context: context);

  @override
  List<KurbanAnimal>? get animals {
    _$animalsAtom.reportRead();
    return super.animals;
  }

  @override
  set animals(List<KurbanAnimal>? value) {
    _$animalsAtom.reportWrite(value, super.animals, () {
      super.animals = value;
    });
  }

  late final _$filterAtom = Atom(name: '_KurbanStore.filter', context: context);

  @override
  Filter? get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Filter? value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$getAnimalsAsyncAction =
      AsyncAction('_KurbanStore.getAnimals', context: context);

  @override
  Future<dynamic> getAnimals() {
    return _$getAnimalsAsyncAction.run(() => super.getAnimals());
  }

  late final _$_KurbanStoreActionController =
      ActionController(name: '_KurbanStore', context: context);

  @override
  dynamic createFilter(
      {KurbanAnimal? animal, int? selectedProvince, int? selectedDistrict}) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.createFilter');
    try {
      return super.createFilter(
          animal: animal,
          selectedProvince: selectedProvince,
          selectedDistrict: selectedDistrict);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals},
filter: ${filter}
    ''';
  }
}
