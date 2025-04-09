import 'package:kurbandas/stores/api/app_setting_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
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

  _RootStore(
      {required this.urlLauncherStore,
      required this.appSettingStore,
      required this.authStore});
}
