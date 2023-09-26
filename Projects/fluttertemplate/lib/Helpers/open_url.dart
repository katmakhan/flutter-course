import 'package:url_launcher/url_launcher.dart';

class OpenHelper {
  static Future<void> openUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // can't launch url, there is some error
      throw "Could not launch $url";
    }
  }
}
