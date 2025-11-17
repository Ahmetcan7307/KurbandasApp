import 'dart:io';

import 'package:easy_social_share/easy_social_share.dart';

class ShareService {
  final EasySocialShare easySocialShare = EasySocialShare();

  Future<bool> shareToSystem(String message) async =>
      (Platform.isAndroid
          ? await easySocialShare.android.shareToSystem("title", message, null)
          : await easySocialShare.iOS.shareToSystem(message)) ==
      "success";
}
