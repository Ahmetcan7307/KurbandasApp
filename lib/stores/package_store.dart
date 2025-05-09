import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/package_info_service.dart';
import 'package:mobx/mobx.dart';

part 'package_store.g.dart';

class PackageStore = _PackageStore with _$PackageStore;

abstract class _PackageStore with Store {
  PackageInfoService service = serviceLocator.get<PackageInfoService>();

  Future<String> getVersion() async => await service.getVersion();
}
