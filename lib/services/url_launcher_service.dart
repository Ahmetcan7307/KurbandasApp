import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future launchStore(Uri storeUrl) async {
    if (await canLaunchUrl(storeUrl)) {
      await launchUrl(storeUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future launchTel(String phoneNo) async {
    Uri scheme = Uri.parse("tel:$phoneNo");
    if (await canLaunchUrl(scheme)) {
      await launchUrl(scheme);
    }
  }
}
