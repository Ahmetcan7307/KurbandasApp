// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kurban_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KurbanStore on _KurbanStore, Store {
  Computed<int>? _$totalPhotosCountComputed;

  @override
  int get totalPhotosCount => (_$totalPhotosCountComputed ??= Computed<int>(
          () => super.totalPhotosCount,
          name: '_KurbanStore.totalPhotosCount'))
      .value;

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

  late final _$selectedPhotosAtom =
      Atom(name: '_KurbanStore.selectedPhotos', context: context);

  @override
  List<File> get selectedPhotos {
    _$selectedPhotosAtom.reportRead();
    return super.selectedPhotos;
  }

  @override
  set selectedPhotos(List<File> value) {
    _$selectedPhotosAtom.reportWrite(value, super.selectedPhotos, () {
      super.selectedPhotos = value;
    });
  }

  late final _$selectedKurbanDocumentIdAtom =
      Atom(name: '_KurbanStore.selectedKurbanDocumentId', context: context);

  @override
  String? get selectedKurbanDocumentId {
    _$selectedKurbanDocumentIdAtom.reportRead();
    return super.selectedKurbanDocumentId;
  }

  @override
  set selectedKurbanDocumentId(String? value) {
    _$selectedKurbanDocumentIdAtom
        .reportWrite(value, super.selectedKurbanDocumentId, () {
      super.selectedKurbanDocumentId = value;
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

  late final _$updateKurbanAsyncAction =
      AsyncAction('_KurbanStore.updateKurban', context: context);

  @override
  Future<dynamic> updateKurban() {
    return _$updateKurbanAsyncAction.run(() => super.updateKurban());
  }

  late final _$getMyPartnershipsAsyncAction =
      AsyncAction('_KurbanStore.getMyPartnerships', context: context);

  @override
  Future<dynamic> getMyPartnerships() {
    return _$getMyPartnershipsAsyncAction.run(() => super.getMyPartnerships());
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

  late final _$createAsyncAction =
      AsyncAction('_KurbanStore.create', context: context);

  @override
  Future<dynamic> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_KurbanStore.pickImage', context: context);

  @override
  Future<dynamic> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$pickMultiImageAsyncAction =
      AsyncAction('_KurbanStore.pickMultiImage', context: context);

  @override
  Future<bool> pickMultiImage() {
    return _$pickMultiImageAsyncAction.run(() => super.pickMultiImage());
  }

  late final _$getImagesAsyncAction =
      AsyncAction('_KurbanStore.getImages', context: context);

  @override
  Future<dynamic> getImages(BuildContext context, S lang, ImageSource source) {
    return _$getImagesAsyncAction
        .run(() => super.getImages(context, lang, source));
  }

  late final _$getAsyncAction =
      AsyncAction('_KurbanStore.get', context: context);

  @override
  Future<dynamic> get(bool isEdit) {
    return _$getAsyncAction.run(() => super.get(isEdit));
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
  dynamic selectKurban(bool isMy, bool isActive, int index) {
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
  dynamic removePhoto(int index) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.removePhoto');
    try {
      return super.removePhoto(index);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectSelectedKurbanProvince(TurkiyeAPIProvince province) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectSelectedKurbanProvince');
    try {
      return super.selectSelectedKurbanProvince(province);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removePhotoUrl(int index) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.removePhotoUrl');
    try {
      return super.removePhotoUrl(index);
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nullSelectedKurban() {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.nullSelectedKurban');
    try {
      return super.nullSelectedKurban();
    } finally {
      _$_KurbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectPartnership(String documentId) {
    final _$actionInfo = _$_KurbanStoreActionController.startAction(
        name: '_KurbanStore.selectPartnership');
    try {
      return super.selectPartnership(documentId);
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
activeKurbans: ${activeKurbans},
deactiveKurbans: ${deactiveKurbans},
selectedKurban: ${selectedKurban},
newKurban: ${newKurban},
selectedPhotos: ${selectedPhotos},
selectedKurbanDocumentId: ${selectedKurbanDocumentId},
totalPhotosCount: ${totalPhotosCount}
    ''';
  }
}
