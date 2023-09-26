// ignore_for_file: depend_on_referenced_packages

import 'package:package_info_plus/package_info_plus.dart';

Future<int> getBuildNumber() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // String appName = packageInfo.appName;
  // String packageName = packageInfo.packageName;
  // String version = packageInfo.version;
  int buildNumber = int.parse(packageInfo.buildNumber);

  return buildNumber;
}
