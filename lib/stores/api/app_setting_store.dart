import 'package:kurbandas/core/const/my_api/app_setting_service.dart';
import 'package:mobx/mobx.dart';

part 'app_setting_store.g.dart';

class AppSettingStore = _AppSettingStore with _$AppSettingStore;

abstract class _AppSettingStore with Store {
  String getRequiredVersion() => AppSettingService.get.requiredVersion;
}
