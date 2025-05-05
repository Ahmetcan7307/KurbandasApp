import 'package:kurbandas/services/package_info_service.dart';
import 'package:kurbandas/services/store_service.dart';
import 'package:mobx/mobx.dart';

import '../injector.dart';
import '../services/url_launcher_service.dart';

part 'url_launcher_store.g.dart';

class UrlLauncherStore = _UrlLauncherStore with _$UrlLauncherStore;

abstract class _UrlLauncherStore with Store {
  final UrlLauncherService _service = serviceLocator.get<UrlLauncherService>();
  final StoreService storeService = serviceLocator.get<StoreService>();
  final PackageInfoService packageInfoService =
      serviceLocator.get<PackageInfoService>();

  Future launchStore(Uri? storeUrl, {String? iosAppStoreId}) async =>
      _service.launchStore(storeUrl ??
          Uri.parse(storeService.getStoreUrl(
              iosAppStoreId, await packageInfoService.getPackageName())!));

  Future launchTel(String phoneNo) async =>
      _service.launchScheme("tel", phoneNo);

  Future launchSms(String phoneNo) async =>
      _service.launchScheme("sms", phoneNo);
}
