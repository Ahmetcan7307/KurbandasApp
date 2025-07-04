import 'package:kurbandas/stores/api/app_setting_store.dart';
import 'package:kurbandas/stores/api/kurban_report_store.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/country_store.dart';
import 'package:kurbandas/stores/package_store.dart';
import 'package:kurbandas/stores/share_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';
import 'package:mobx/mobx.dart';

part "root_store.g.dart";

// ignore: library_private_types_in_public_api
class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {
  @observable
  late UrlLauncherStore urlLauncherStore;

  @observable
  late AppSettingStore appSettingStore;

  @observable
  late AuthStore authStore;

  @observable
  late TurkiyeAPIStore turkiyeAPIStore;

  @observable
  late KurbanStore kurbanStore;

  @observable
  late PackageStore packageStore;

  @observable
  late CountryStore countryStore;

  @observable
  late KurbanReportStore kurbanReportStore;

  @observable
  late ShareStore shareStore;

  _RootStore(
      {required this.urlLauncherStore,
      required this.appSettingStore,
      required this.authStore,
      required this.turkiyeAPIStore,
      required this.kurbanStore,
      required this.packageStore,
      required this.countryStore,
      required this.kurbanReportStore,
      required this.shareStore});
}
