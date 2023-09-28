import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/Dialogs/custom_dialog.dart';
import 'package:fluttertemplate/Helpers/open_url.dart';
import 'package:fluttertemplate/Helpers/update_helper.dart';

bool compulsory = false;
String androidurl =
    "https://play.google.com/store/apps/details?id=com.btechtraders.btechtraders";
String iosurl = "https://apps.apple.com/in/app/btechtraders/id6447514602";

Future<void> fetchRemoteConfig(BuildContext context) async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  try {
    // Using zero duration to force fetching from remote server.
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 120),
      ),
    );

    // Activate the oldervalues immediately
    await remoteConfig.activate();

    //Then fetch the latest values
    await remoteConfig.fetch();

    iosurl = remoteConfig.getString('ioslink');
    androidurl = remoteConfig.getString('androidlink');
    String message = remoteConfig.getString('Message');

    int latestVersion = remoteConfig.getInt('latest_version');
    int minVersion = remoteConfig.getInt('min_version');

    int bnumber = await getBuildNumber();
    print("Current Build Number: $bnumber");
    print("Latest Build Number: $latestVersion");
    print("Min Build Number: $minVersion");

    //Compulsory Logic
    if (bnumber < minVersion) {
      compulsory = true;
    } else {
      compulsory = false;
    }

    //To show dialog
    if (bnumber < latestVersion) {
      // ignore: use_build_context_synchronously
      DialogUtils().showCustomDialogUpdate(context, "Update Available", message,
          "Update", "Cancel", updateFunction, cancelFunction, compulsory);
    }

    // DialogUtils().showCustomDialogUpdate(context, title, descrip, okBtnText, cancelBtnText, okBtnFunction, cancelBtnFunction)
  } catch (e) {
    // Handle error
    print('Error fetching remote config: $e');
  }
}

updateFunction() {
  // compulsory=
  if (Platform.isIOS) {
    print('is a IOS');
    OpenHelper.openUrl(iosurl);
  } else if (Platform.isAndroid) {
    print('is a Andriod');
    OpenHelper.openUrl(androidurl);
  } else {}
}

cancelFunction(BuildContext context) {
  if (compulsory) {
  } else {
    Navigator.pop(context);
  }
}
