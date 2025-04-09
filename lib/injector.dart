import 'package:get_it/get_it.dart';
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

  serviceLocator.registerLazySingleton(() => PackageInfoService());
  serviceLocator.registerLazySingleton(() => UrlLauncherService());
  serviceLocator.registerLazySingleton(() => AppSettingService());
  serviceLocator.registerLazySingleton(() => AuthService());
  serviceLocator.registerLazySingleton(() => UserService());

  serviceLocator.registerLazySingleton(() => RootStore(
      urlLauncherStore: serviceLocator.get<UrlLauncherStore>(),
      appSettingStore: serviceLocator.get<AppSettingStore>(),
      authStore: serviceLocator.get<AuthStore>()));
}
