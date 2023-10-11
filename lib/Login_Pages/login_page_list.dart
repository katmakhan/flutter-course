// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertemplate/Components/list_view.dart';
import 'package:fluttertemplate/Dropdown/single_dropdown.dart';
import 'package:fluttertemplate/Login_Pages/sign_in_1.dart';
import 'package:fluttertemplate/Login_Pages/sign_in_2.dart';

class login_listView extends StatefulWidget {
  const login_listView({super.key});

  @override
  State<login_listView> createState() => _login_listViewState();
}

class _login_listViewState extends State<login_listView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Cust_ListView(
              custtext: "LoginPage",
              custsubtext: "Basic Description",
              onTap: onTap),
          Cust_ListView(
              custtext: "LoginPage2",
              custsubtext: "Basic Description",
              onTap: onTap2),
          Cust_ListView(
              custtext: "Dropdown",
              custsubtext: "Drop down functionality",
              onTap: onTap3)
        ]),
      ),
    );
  }

  onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInOne()),
    );
  }

  onTap2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInTwo()),
    );
  }

  onTap3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SingleDropdown()),
    );
  }
}
