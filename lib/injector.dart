import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kurbandas/core/const/hive_cons.dart';
import 'package:kurbandas/services/api/app_setting_service.dart';
import 'package:kurbandas/services/api/user_service.dart';
import 'package:kurbandas/services/package_info_service.dart';
import 'package:kurbandas/services/supabase/auth_service.dart';
import 'package:kurbandas/services/url_launcher_service.dart';
import 'package:kurbandas/stores/api/app_setting_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';

GetIt serviceLocator = GetIt.instance;

Future init() async {
  serviceLocator.registerFactory(() => UrlLauncherStore());
  serviceLocator.registerFactory(() => AppSettingStore());
  serviceLocator.registerFactory(() => AuthStore());

  serviceLocator.registerLazySingleton(() => Dio());

  await Hive.initFlutter();
  await Hive.openBox<String>(HiveCons.settings);

  initDio();

  serviceLocator.registerLazySingleton(() => PackageInfoService());
  serviceLocator.registerLazySingleton(() => UrlLauncherService());
  serviceLocator.registerLazySingleton(() => AppSettingService());
  serviceLocator.registerLazySingleton(() => AuthService());
  serviceLocator
      .registerLazySingleton(() => UserService(serviceLocator.get<Dio>()));

  serviceLocator.registerLazySingleton(() => RootStore(
      urlLauncherStore: serviceLocator.get<UrlLauncherStore>(),
      appSettingStore: serviceLocator.get<AppSettingStore>(),
      authStore: serviceLocator.get<AuthStore>()));
}

initDio() {
  serviceLocator.get<Dio>().interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
        .putIfAbsent("Authorization", () => "Bearer ${dotenv.env["apiKey"]}");

    Box<String> settingsBox = Hive.box(HiveCons.settings);
    if (settingsBox.containsKey(HiveCons.token)) {
      options.headers
          .putIfAbsent("token", () => settingsBox.get(HiveCons.token));
    }

    return handler.next(options);
  }));
}
