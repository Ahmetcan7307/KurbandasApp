import 'package:mobx/mobx.dart';

import '../injector.dart';
import '../services/url_launcher_service.dart';

part 'url_launcher_store.g.dart';

class UrlLauncherStore = _UrlLauncherStore with _$UrlLauncherStore;

abstract class _UrlLauncherStore with Store {
  final UrlLauncherService _service = serviceLocator.get<UrlLauncherService>();

  Future launchStore(Uri storeUrl) async => _service.launchStore(storeUrl);
}
