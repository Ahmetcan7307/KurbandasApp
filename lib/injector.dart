import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kurbandas/core/const/get_cons.dart';
import 'package:kurbandas/core/const/hive_cons.dart';
import 'package:kurbandas/services/apis/google_apis/google_api_service.dart';
import 'package:kurbandas/services/apis/my_api/app_setting_service.dart';
import 'package:kurbandas/services/apis/my_api/country_service.dart';
import 'package:kurbandas/services/apis/my_api/kurban_report_service.dart';
import 'package:kurbandas/services/apis/my_api/kurban_request_service.dart';
import 'package:kurbandas/services/apis/my_api/kurban_service.dart';
import 'package:kurbandas/services/apis/my_api/user_service.dart';
import 'package:kurbandas/services/apis/turkiye_api/turkiye_api_service.dart';
import 'package:kurbandas/services/encrypt_service.dart';
import 'package:kurbandas/services/image_picker_service.dart';
import 'package:kurbandas/services/package_info_service.dart';
import 'package:kurbandas/services/share_service.dart';
import 'package:kurbandas/services/store_service.dart';
import 'package:kurbandas/services/string_service.dart';
import 'package:kurbandas/services/supabase/auth_service.dart';
import 'package:kurbandas/services/supabase/storage_service.dart';
import 'package:kurbandas/services/url_launcher_service.dart';
import 'package:kurbandas/stores/api/app_setting_store.dart';
import 'package:kurbandas/stores/api/kurban_report_store.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/country_store.dart';
import 'package:kurbandas/stores/package_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/share_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:kurbandas/stores/turkiye_api_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';

GetIt serviceLocator = GetIt.instance;

Future init() async {
  serviceLocator.registerFactory(() => UrlLauncherStore());
  serviceLocator.registerFactory(() => AppSettingStore());
  serviceLocator.registerFactory(() => AuthStore());
  serviceLocator.registerFactory(() => TurkiyeAPIStore());
  serviceLocator.registerFactory(() => KurbanStore());
  serviceLocator.registerFactory(() => PackageStore());
  serviceLocator.registerFactory(() => CountryStore());
  serviceLocator.registerFactory(() => KurbanReportStore());
  serviceLocator.registerFactory(() => ShareStore());

  serviceLocator.registerLazySingleton(
    () => Dio(),
    instanceName: GetCons.myAPIDio,
  );
  serviceLocator.registerLazySingleton(
    () => Dio(),
    instanceName: GetCons.othersDio,
  );

  await Hive.initFlutter();
  await Hive.openBox<String>(HiveCons.settings);

  initDio();

  serviceLocator.registerLazySingleton(() => PackageInfoService());
  serviceLocator.registerLazySingleton(() => UrlLauncherService());
  serviceLocator.registerLazySingleton(
    () => AppSettingService(
      serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio),
    ),
  );
  serviceLocator.registerLazySingleton(() => AuthService());
  serviceLocator.registerLazySingleton(
    () => UserService(serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio)),
  );
  serviceLocator.registerLazySingleton(
    () => TurkiyeAPIService(
      dio: serviceLocator.get<Dio>(instanceName: GetCons.othersDio),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => KurbanService(
      dio: serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GoogleApiService(
      serviceLocator.get<Dio>(instanceName: GetCons.othersDio),
    ),
  );
  serviceLocator.registerLazySingleton(() => StoreService());
  serviceLocator.registerLazySingleton(() => ImagePickerService());
  serviceLocator.registerLazySingleton(() => StorageService());
  serviceLocator.registerLazySingleton(
    () =>
        CountryService(serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio)),
  );
  serviceLocator.registerLazySingleton(() => StringService());
  serviceLocator.registerLazySingleton(
    () => KurbanRequestService(
      serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => KurbanReportService(
      serviceLocator.get<Dio>(instanceName: GetCons.myAPIDio),
    ),
  );
  serviceLocator.registerLazySingleton(() => ShareService());
  serviceLocator.registerLazySingleton(() => EncryptService());

  serviceLocator.registerLazySingleton(
    () => RootStore(
      urlLauncherStore: serviceLocator.get<UrlLauncherStore>(),
      appSettingStore: serviceLocator.get<AppSettingStore>(),
      authStore: serviceLocator.get<AuthStore>(),
      turkiyeAPIStore: serviceLocator.get<TurkiyeAPIStore>(),
      kurbanStore: serviceLocator.get<KurbanStore>(),
      packageStore: serviceLocator.get<PackageStore>(),
      countryStore: serviceLocator.get<CountryStore>(),
      kurbanReportStore: serviceLocator.get<KurbanReportStore>(),
      shareStore: serviceLocator.get<ShareStore>(),
    ),
  );
}

void initDio() {
  serviceLocator.get<Dio>(instanceName: "MyAPI").interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["Authorization"] = "Bearer ${dotenv.env["apiKey"]}";

        Box<String> settingsBox = Hive.box(HiveCons.settings);
        if (settingsBox.containsKey(HiveCons.token)) {
          options.headers["token"] = settingsBox.get(HiveCons.token);
        }

        return handler.next(options);
      },
    ),
  );
}
