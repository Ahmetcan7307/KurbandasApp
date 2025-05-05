import 'package:kurbandas/services/package_info_service.dart';
import 'package:kurbandas/services/store_service.dart';
import 'package:pub_semver/pub_semver.dart';

import '../injector.dart';

class ForceUpdateClient {
  Future<String> Function() fetchRequiredVersion;
  String? iosAppStoreId;

  ForceUpdateClient({required this.fetchRequiredVersion, this.iosAppStoreId});

  final PackageInfoService _packageInfoService =
      serviceLocator.get<PackageInfoService>();
  final StoreService storeService = serviceLocator.get<StoreService>();

  Future<bool> isAppUpdateRequired() async {
    return Version.parse(RegExp(r'\d+\.\d+\.\d+')
            .matchAsPrefix(await _packageInfoService.getVersion())!
            .group(0)!) <
        Version.parse(await fetchRequiredVersion());
  }

  Future<String?> getStoreUrl() async => storeService.getStoreUrl(
      iosAppStoreId, await _packageInfoService.getPackageName());
}
