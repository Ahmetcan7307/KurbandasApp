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

  late final _$myPartnershipsAtom =
      Atom(name: '_KurbanStore.myPartnerships', context: context);

  @override
  List<Kurban>? get myPartnerships {
    _$myPartnershipsAtom.reportRead();
    return super.myPartnerships;
  }

  @override
  set myPartnerships(List<Kurban>? value) {
    _$myPartnershipsAtom.reportWrite(value, super.myPartnerships, () {
      super.myPartnerships = value;
    });
  }

  late final _$allKurbansAtom =
      Atom(name: '_KurbanStore.allKurbans', context: context);

  @override
  Set<Kurban> get allKurbans {
    _$allKurbansAtom.reportRead();
    return super.allKurbans;
  }

  @override
  set allKurbans(Set<Kurban> value) {
    _$allKurbansAtom.reportWrite(value, super.allKurbans, () {
      super.allKurbans = value;
    });
  }

  late final _$activeKurbansAtom =
      Atom(name: '_KurbanStore.activeKurbans', context: context);

  @override
  Set<Kurban> get activeKurbans {
    _$activeKurbansAtom.reportRead();
    return super.activeKurbans;
  }

  @override
  set activeKurbans(Set<Kurban> value) {
    _$activeKurbansAtom.reportWrite(value, super.activeKurbans, () {
      super.activeKurbans = value;
    });
  }

  late final _$deactiveKurbansAtom =
      Atom(name: '_KurbanStore.deactiveKurbans', context: context);

  @override
  Set<Kurban> get deactiveKurbans {
    _$deactiveKurbansAtom.reportRead();
    return super.deactiveKurbans;
  }

  @override
  set deactiveKurbans(Set<Kurban> value) {
    _$deactiveKurbansAtom.reportWrite(value, super.deactiveKurbans, () {
      super.deactiveKurbans = value;
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

  late final _$newKurbanAtom =
      Atom(name: '_KurbanStore.newKurban', context: context);

  @override
  Kurban? get newKurban {
    _$newKurbanAtom.reportRead();
    return super.newKurban;
  }

  @override
  set newKurban(Kurban? value) {
    _$newKurbanAtom.reportWrite(value, super.newKurban, () {
      super.newKurban = value;
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

  late final _$getMyPartnershipsAsyncAction =
      AsyncAction('_KurbanStore.getMyPartnerships', context: context);

  @override
  Future<dynamic> getMyPartnerships() {
    return _$getMyPartnershipsAsyncAction.run(() => super.getMyPartnerships());
  }

  late final _$getAllKurbansAsyncAction =
      AsyncAction('_KurbanStore.getAllKurbans', context: context);

  @override
  Future<bool> getAllKurbans(int page) {
    return _$getAllKurbansAsyncAction.run(() => super.getAllKurbans(page));
  }

  late final _$getActiveKurbansAsyncAction =
      AsyncAction('_KurbanStore.getActiveKurbans', context: context);

  @override
  Future<bool> getActiveKurbans(int page) {
    return _$getActiveKurbansAsyncAction
        .run(() => super.getActiveKurbans(page));
  }

  late final _$getDeactiveKurbansAsyncAction =
      AsyncAction('_KurbanStore.getDeactiveKurbans', context: context);

  @override
  Future<bool> getDeactiveKurbans(int page) {
    return _$getDeactiveKurbansAsyncAction
        .run(() => super.getDeactiveKurbans(page));
  }

  late final _$createKurbanAsyncAction =
      AsyncAction('_KurbanStore.createKurban', context: context);

  @override
  Future<dynamic> createKurban() {
    return _$createKurbanAsyncAction.run(() => super.createKurban());
  }

  late final _$_KurbanStoreActionController =
      ActionController(name: '_KurbanStore', context: context);

  @override
  dynamic createFilter(
      {KurbanAnimal? animal,
      TurkiyeAPIProvince? selectedProvince,
      TurkiyeAPIDistrict? selectedDistrict}) {
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
  dynamic clearFilter() {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearKurbanses() {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.clearKurbanses');
    try {
      return super.clearKurbanses();
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectKurban(bool isMy, bool? isActive, int index) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectKurban');
    try {
      return super.selectKurban(isMy, isActive, index);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectNewKurbanAnimal(KurbanAnimal animal) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectNewKurbanAnimal');
    try {
      return super.selectNewKurbanAnimal(animal);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectNewKurbanProvince(TurkiyeAPIProvince province) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectNewKurbanProvince');
    try {
      return super.selectNewKurbanProvince(province);
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
requests: ${requests},
myPartnerships: ${myPartnerships},
allKurbans: ${allKurbans},
activeKurbans: ${activeKurbans},
deactiveKurbans: ${deactiveKurbans},
selectedKurban: ${selectedKurban},
newKurban: ${newKurban}
    ''';
  }
}
