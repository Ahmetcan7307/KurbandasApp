import 'package:flutter/foundation.dart';

class StoreService {
  String? getStoreUrl(String? iosAppStoreId, String packageName) =>
      defaultTargetPlatform == TargetPlatform.iOS
          ? iosAppStoreId != null
              ? "https://apps.apple.com/app/id$iosAppStoreId"
              : null
          : defaultTargetPlatform == TargetPlatform.android
              ? "https://play.google.com/store/apps/details?id=$packageName"
              : null;
}
