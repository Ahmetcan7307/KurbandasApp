import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/app_setting.dart';

import 'my_api.dart';

class AppSettingService {
  final Dio dio;

  AppSettingService(this.dio);

  Future<AppSetting> get() async {
    Response<Map<String, dynamic>> response = await dio
        .get(MyAPI.getUrl(Controllers.appSettings, "GetRequiredVersion"));

    if (response.statusCode == 200) {
      return AppSetting.fromJson(response.data!);
    }

    throw MyAPI.getError(response);
  }
}
