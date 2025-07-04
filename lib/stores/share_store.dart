// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kurbandas/core/const/share_cons.dart';
import 'package:mobx/mobx.dart';

import '../injector.dart';
import '../services/package_info_service.dart';
import '../services/share_service.dart';
import '../services/store_service.dart';

part 'share_store.g.dart';

class ShareStore = _ShareStore with _$ShareStore;

abstract class _ShareStore with Store {
  final ShareService shareService = serviceLocator.get<ShareService>();
  final StoreService storeService = serviceLocator.get<StoreService>();
  final PackageInfoService packageInfoService =
      serviceLocator.get<PackageInfoService>();

  Future<bool> openSystemSheetWithShare(BuildContext context) async =>
      await shareService.openSystemSheet(
          "Kurbandaş",
          "${ShareCons.getMessage(context)}"
              "${storeService.getStoreUrl(dotenv.env["iosAppStoreId"], await packageInfoService.getPackageName())!}");
}
