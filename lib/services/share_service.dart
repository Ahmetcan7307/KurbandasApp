import 'package:flutter_social_share_plugin/flutter_social_share.dart';

class ShareService {
  final FlutterSocialShare flutterSocialShare = FlutterSocialShare();

  Future<bool> shareToSystem(String message) async =>
      await flutterSocialShare.shareToSystem(msg: message) == "success";
}
