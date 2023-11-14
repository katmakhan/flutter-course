import 'dart:io';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/firebase_remoteconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/Login_Pages/login_page_list.dart';
import 'package:fluttertemplate/Main_Frags/frag_profile.dart';
import 'package:fluttertemplate/Main_Frags/frag_realtime.dart';
import 'package:fluttertemplate/Main_Frags/frag_saved.dart';
import 'package:fluttertemplate/RecyclerView/combined_recycler_button.dart';

class Homepage extends StatefulWidget {
  final int? fragpos;
  const Homepage(this.fragpos, {Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Frames
  List pages = [
    const FragSaved(),
    const login_listView(),
    const CombinedRecycler_withButton(),
    // const FragRealtime(),
    const FragProfile()
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      // print("Current on $index");
    });
  }

  @override
  void initState() {
    if (widget.fragpos != null) {
      currentIndex = widget.fragpos!;
    }
    fetchRemoteConfig(context);
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
                  icon: SvgPicture.asset("assets/svg_home/homeu.svg"),
                  label: "Home",
                  activeIcon: SvgPicture.asset("assets/svg_home/homes.svg"),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_home/homeu.svg"),
                  label: "Login Pages",
                  activeIcon: SvgPicture.asset("assets/svg_home/homes.svg"),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_home/homeu.svg"),
                  label: "Recycler",
                  activeIcon: SvgPicture.asset("assets/svg_home/homes.svg"),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_home/profileu.svg"),
                  label: "Profile",
                  activeIcon: SvgPicture.asset("assets/svg_home/profiles.svg"),
                )
              ]),
        ),
      ),
    );
  }
}
