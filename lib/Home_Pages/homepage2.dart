// ignore_for_file: camel_case_types
import 'package:fluttertemplate/Components/bottom_navy_bar.dart';
import 'package:fluttertemplate/Helpers/firebase_remoteconfig.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/Main_Frags/frag_profile.dart';
import 'package:fluttertemplate/Main_Frags/frag_saved.dart';

class Homepage_NavButton extends StatefulWidget {
  final int? fragpos;
  const Homepage_NavButton(this.fragpos, {Key? key}) : super(key: key);

  @override
  State<Homepage_NavButton> createState() => _Homepage_NavButtonState();
}

class _Homepage_NavButtonState extends State<Homepage_NavButton> {
  //Frames
  List pages = [const FragSaved(), const FragProfile()];
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
    int _currentIndex = 0;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
