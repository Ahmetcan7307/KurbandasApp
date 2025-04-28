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

  late final _$myKurbansAtom =
      Atom(name: '_KurbanStore.myKurbans', context: context);

  @override
  List<Kurban>? get myKurbans {
    _$myKurbansAtom.reportRead();
    return super.myKurbans;
  }

  @override
  set myKurbans(List<Kurban>? value) {
    _$myKurbansAtom.reportWrite(value, super.myKurbans, () {
      super.myKurbans = value;
    });
  }

  late final _$selectedKurbanAtom =
      Atom(name: '_KurbanStore.selectedKurban', context: context);

  @override
  Kurban? get selectedKurban {
    _$selectedKurbanAtom.reportRead();
    return super.selectedKurban;
  }

  @override
  set selectedKurban(Kurban? value) {
    _$selectedKurbanAtom.reportWrite(value, super.selectedKurban, () {
      super.selectedKurban = value;
    });
  }

  late final _$requestsAtom =
      Atom(name: '_KurbanStore.requests', context: context);

  @override
  List<KurbanRequest>? get requests {
    _$requestsAtom.reportRead();
    return super.requests;
  }

  @override
  set requests(List<KurbanRequest>? value) {
    _$requestsAtom.reportWrite(value, super.requests, () {
      super.requests = value;
    });
  }

  late final _$getAnimalsAsyncAction =
      AsyncAction('_KurbanStore.getAnimals', context: context);

  @override
  Future<dynamic> getAnimals() {
    return _$getAnimalsAsyncAction.run(() => super.getAnimals());
  }

  late final _$getMyKurbansAsyncAction =
      AsyncAction('_KurbanStore.getMyKurbans', context: context);

  @override
  Future<dynamic> getMyKurbans() {
    return _$getMyKurbansAsyncAction.run(() => super.getMyKurbans());
  }

  late final _$getRequestsAsyncAction =
      AsyncAction('_KurbanStore.getRequests', context: context);

  @override
  Future<dynamic> getRequests() {
    return _$getRequestsAsyncAction.run(() => super.getRequests());
  }

  late final _$approveOrDeclineRequestAsyncAction =
      AsyncAction('_KurbanStore.approveOrDeclineRequest', context: context);

  @override
  Future<dynamic> approveOrDeclineRequest(String documentId, bool isApprove) {
    return _$approveOrDeclineRequestAsyncAction
        .run(() => super.approveOrDeclineRequest(documentId, isApprove));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_KurbanStore.delete', context: context);

  @override
  Future<List<Kurban>> delete(String documentId) {
    return _$deleteAsyncAction.run(() => super.delete(documentId));
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
  dynamic selectMyKurban(int index) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectMyKurban');
    try {
      return super.selectMyKurban(index);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals},
filter: ${filter},
myKurbans: ${myKurbans},
selectedKurban: ${selectedKurban},
requests: ${requests}
    ''';
  }
}
