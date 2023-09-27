import 'dart:io';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Dialogs/custom_dialog.dart';
import 'package:fluttertemplate/Helpers/open_url.dart';
import 'package:fluttertemplate/Helpers/update_helper.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/Main_Frags/frag_profile.dart';
import 'package:fluttertemplate/Main_Frags/frag_saved.dart';

class Homepage extends StatefulWidget {
  final int? fragpos;
  const Homepage(this.fragpos, {Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool compulsory = false;
  String androidurl =
      "https://play.google.com/store/apps/details?id=com.btechtraders.btechtraders";
  String iosurl = "https://apps.apple.com/in/app/btechtraders/id6447514602";
  List pages = [const FragSaved(), const FragProfile()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
      print("Current on $index");
    });
  }

  @override
  void initState() {
    if (widget.fragpos != null) {
      currentIndex = widget.fragpos!;
    }
    // fetchRemoteConfig();
    super.initState();
  }

  // PageController _dotcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: Platform.isIOS ? 91 : 65,
        color: AppColors.white,
        child: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: AppColors.white,

            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: AppColors.white,
            // bottomAppBarColor: AppColors.white,
            // textTheme: Theme.of(context).textTheme.copyWith(
            //     caption: const TextStyle(
            //         color: Color(
            //             0xffe0e0e0)))
          ), // sets the inactive color of the `BottomNavigationBar`
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              onTap: onTap,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.black.withOpacity(0.4),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/homeu.svg"),
                  label: "Home",
                  activeIcon: SvgPicture.asset("assets/svg/homes.svg"),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/profileu.svg"),
                  label: "Profile",
                  activeIcon: SvgPicture.asset("assets/svg/profiles.svg"),
                )
              ]),
        ),
      ),
    );
  }

  Future<void> fetchRemoteConfig() async {
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
        DialogUtils().showCustomDialogUpdate(
            context,
            "Update Available",
            message,
            "Update",
            "Cancel",
            updateFunction,
            cancelFunction,
            compulsory);
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

  cancelFunction() {
    if (compulsory) {
    } else {
      Navigator.pop(context);
    }
  }
}
