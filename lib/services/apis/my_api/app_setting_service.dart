import 'package:kurbandas/core/domain/entities/app_setting.dart';

class AppSettingService {
  Future<AppSetting> get() async {
    return AppSetting("1.0.0");
  }
}
