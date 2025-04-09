import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  Future<String> getVersion() async =>
      (await PackageInfo.fromPlatform()).version;

  Future<String> getPackageName() async =>
      (await PackageInfo.fromPlatform()).packageName;
}
