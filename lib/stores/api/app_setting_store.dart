import 'package:kurbandas/services/apis/my_api/app_setting_service.dart';
import 'package:mobx/mobx.dart';

import '../../injector.dart';

part 'app_setting_store.g.dart';

class AppSettingStore = _AppSettingStore with _$AppSettingStore;

abstract class _AppSettingStore with Store {
  final AppSettingService _appSettingService =
      serviceLocator.get<AppSettingService>();

  Future<String> getRequiredVersion() async =>
      (await _appSettingService.get()).requiredVersion;
}
