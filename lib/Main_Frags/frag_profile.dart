// ignore_for_file: depend_on_referenced_packages

import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:fluttertemplate/Components/customersupport.dart';
import 'package:fluttertemplate/Components/profile_sections.dart';
import 'package:fluttertemplate/DB_Services/database_write.dart';
import 'package:fluttertemplate/Dialogs/custom_dialog.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:fluttertemplate/Helpers/open_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FragProfile extends StatefulWidget {
  const FragProfile({Key? key}) : super(key: key);

  @override
  State<FragProfile> createState() => _FragProfileState();
}

class _FragProfileState extends State<FragProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        // brightness: Brightness.light,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        // controller: controller,
        child: mainColumn(context),
      )),
    );
  }

  Column mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Constants.lineSection(),
        headingSection(),
        ProfileSections(
            sectiontext: "About Us",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/about.svg",
            onTap: aboutUsFunction),
        Constants.lineSection(),
        ProfileSections(
            sectiontext: "App Feedback",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/feedback.svg",
            onTap: contactUsFunction),
        Constants.lineSection(),
        ProfileSections(
            sectiontext: "Terms & Conditions",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/terms.svg",
            onTap: termsandConditionsFunction),
        Constants.lineSection(),
        ProfileSections(
            sectiontext: "Privacy policy",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/privacy.svg",
            onTap: privacyFunction),
        const CustomerSupport(),
        Constants.lineSection(),
        ProfileSections(
            sectiontext: "Logout",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/delete.svg",
            onTap: logoutFunction),
        Constants.lineSection(),
        ProfileSections(
            sectiontext: "Delete User Data",
            sideicon: Icons.chevron_right,
            svgimageurl: "assets/svg_profile/delete.svg",
            onTap: deleteUserDataFunction),
        Constants.lineSection(),
      ],
    );
  }

  Container headingSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      child: const Text("Help & Support", style: Constants.headingTextStyle),
    );
  }

  void deleteUserDataRTD() {
    Navigator.pop(context);
    GlobalSnackBarGet().showGetSucess("Sucess", "Logout Sucessfully");
    //Delete the userinfo
    DatabaseWriteService().deleteFromRTD(
        "totalusers/${FirebaseAuth.instance.currentUser!.uid}", false);
    AuthService().signOut();
  }

  cancelFunction() {
    Navigator.pop(context);
  }

  aboutUsFunction() {
    OpenHelper.openUrl("https://btechtraders.com");
  }

  contactUsFunction() {
    OpenHelper.openUrl("https://btechtraders.com/contact-us/");
  }

  termsandConditionsFunction() {
    OpenHelper.openUrl("https://btechtraders.com/courses/");
  }

  privacyFunction() {
    OpenHelper.openUrl("https://btechtraders.com/courses/");
  }

  logoutFunction() {
    GlobalSnackBarGet().showGetSucess("Sucess", "Logout Sucessfully");
    AuthService().signOut();
  }

  deleteUserDataFunction() {
    DialogUtils().showCustomDialogAnimated(
        context,
        "Delete Data",
        "Do you want to delete user data?",
        "Delete",
        "Cancel",
        deleteUserDataRTD,
        cancelFunction);
  }
}
