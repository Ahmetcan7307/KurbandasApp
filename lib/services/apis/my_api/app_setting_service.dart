import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/app_setting.dart';

class AppSettingService {
  final Dio dio;

  AppSettingService(this.dio);

  Future<AppSetting> get() async {
    return AppSetting("1.0.0");
  }
}
