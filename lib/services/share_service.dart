import 'dart:io' as os;

import 'package:appinio_social_share/appinio_social_share.dart';

class ShareService {
  final AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  Future<bool> openSystemSheet(String title, String message,
      {String? filePath}) async {
    if (os.Platform.isAndroid) {
      return (await appinioSocialShare.android
          .shareToSystem(title, message, filePath)) ==
          "SUCCESS";
    } else if (os.Platform.isIOS) {
      if (filePath != null) {
        return (await appinioSocialShare.iOS
            .shareToSystem(message, filePaths: [filePath])) ==
            "SUCCESS";
      }
      return (await appinioSocialShare.iOS.shareToSystem(message)) == "SUCCESS";
    }
    return false;
  }
}
