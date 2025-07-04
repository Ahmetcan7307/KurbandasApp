// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootStore on _RootStore, Store {
  late final _$urlLauncherStoreAtom =
      Atom(name: '_RootStore.urlLauncherStore', context: context);

  @override
  UrlLauncherStore get urlLauncherStore {
    _$urlLauncherStoreAtom.reportRead();
    return super.urlLauncherStore;
  }

  bool _urlLauncherStoreIsInitialized = false;

  @override
  set urlLauncherStore(UrlLauncherStore value) {
    _$urlLauncherStoreAtom.reportWrite(
        value, _urlLauncherStoreIsInitialized ? super.urlLauncherStore : null,
        () {
      super.urlLauncherStore = value;
      _urlLauncherStoreIsInitialized = true;
    });
  }

  late final _$appSettingStoreAtom =
      Atom(name: '_RootStore.appSettingStore', context: context);

  @override
  AppSettingStore get appSettingStore {
    _$appSettingStoreAtom.reportRead();
    return super.appSettingStore;
  }

  bool _appSettingStoreIsInitialized = false;

  @override
  set appSettingStore(AppSettingStore value) {
    _$appSettingStoreAtom.reportWrite(
        value, _appSettingStoreIsInitialized ? super.appSettingStore : null,
        () {
      super.appSettingStore = value;
      _appSettingStoreIsInitialized = true;
    });
  }

  late final _$authStoreAtom =
      Atom(name: '_RootStore.authStore', context: context);

  @override
  AuthStore get authStore {
    _$authStoreAtom.reportRead();
    return super.authStore;
  }

  bool _authStoreIsInitialized = false;

  @override
  set authStore(AuthStore value) {
    _$authStoreAtom.reportWrite(
        value, _authStoreIsInitialized ? super.authStore : null, () {
      super.authStore = value;
      _authStoreIsInitialized = true;
    });
  }

  late final _$turkiyeAPIStoreAtom =
      Atom(name: '_RootStore.turkiyeAPIStore', context: context);

  @override
  TurkiyeAPIStore get turkiyeAPIStore {
    _$turkiyeAPIStoreAtom.reportRead();
    return super.turkiyeAPIStore;
  }

  bool _turkiyeAPIStoreIsInitialized = false;

  @override
  set turkiyeAPIStore(TurkiyeAPIStore value) {
    _$turkiyeAPIStoreAtom.reportWrite(
        value, _turkiyeAPIStoreIsInitialized ? super.turkiyeAPIStore : null,
        () {
      super.turkiyeAPIStore = value;
      _turkiyeAPIStoreIsInitialized = true;
    });
  }

  late final _$kurbanStoreAtom =
      Atom(name: '_RootStore.kurbanStore', context: context);

  @override
  KurbanStore get kurbanStore {
    _$kurbanStoreAtom.reportRead();
    return super.kurbanStore;
  }

  bool _kurbanStoreIsInitialized = false;

  @override
  set kurbanStore(KurbanStore value) {
    _$kurbanStoreAtom.reportWrite(
        value, _kurbanStoreIsInitialized ? super.kurbanStore : null, () {
      super.kurbanStore = value;
      _kurbanStoreIsInitialized = true;
    });
  }

  late final _$packageStoreAtom =
      Atom(name: '_RootStore.packageStore', context: context);

  @override
  PackageStore get packageStore {
    _$packageStoreAtom.reportRead();
    return super.packageStore;
  }

  bool _packageStoreIsInitialized = false;

  @override
  set packageStore(PackageStore value) {
    _$packageStoreAtom.reportWrite(
        value, _packageStoreIsInitialized ? super.packageStore : null, () {
      super.packageStore = value;
      _packageStoreIsInitialized = true;
    });
  }

  late final _$countryStoreAtom =
      Atom(name: '_RootStore.countryStore', context: context);

  @override
  CountryStore get countryStore {
    _$countryStoreAtom.reportRead();
    return super.countryStore;
  }

  bool _countryStoreIsInitialized = false;

  @override
  set countryStore(CountryStore value) {
    _$countryStoreAtom.reportWrite(
        value, _countryStoreIsInitialized ? super.countryStore : null, () {
      super.countryStore = value;
      _countryStoreIsInitialized = true;
    });
  }

  late final _$kurbanReportStoreAtom =
      Atom(name: '_RootStore.kurbanReportStore', context: context);

  @override
  KurbanReportStore get kurbanReportStore {
    _$kurbanReportStoreAtom.reportRead();
    return super.kurbanReportStore;
  }

  bool _kurbanReportStoreIsInitialized = false;

  @override
  set kurbanReportStore(KurbanReportStore value) {
    _$kurbanReportStoreAtom.reportWrite(
        value, _kurbanReportStoreIsInitialized ? super.kurbanReportStore : null,
        () {
      super.kurbanReportStore = value;
      _kurbanReportStoreIsInitialized = true;
    });
  }

  late final _$shareStoreAtom =
      Atom(name: '_RootStore.shareStore', context: context);

  @override
  ShareStore get shareStore {
    _$shareStoreAtom.reportRead();
    return super.shareStore;
  }

  bool _shareStoreIsInitialized = false;

  @override
  set shareStore(ShareStore value) {
    _$shareStoreAtom.reportWrite(
        value, _shareStoreIsInitialized ? super.shareStore : null, () {
      super.shareStore = value;
      _shareStoreIsInitialized = true;
    });
  }

  @override
  String toString() {
    return '''
urlLauncherStore: ${urlLauncherStore},
appSettingStore: ${appSettingStore},
authStore: ${authStore},
turkiyeAPIStore: ${turkiyeAPIStore},
kurbanStore: ${kurbanStore},
packageStore: ${packageStore},
countryStore: ${countryStore},
kurbanReportStore: ${kurbanReportStore},
shareStore: ${shareStore}
    ''';
  }
}
