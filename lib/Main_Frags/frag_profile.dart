import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/DB_Services/database_write.dart';
import 'package:fluttertemplate/Dialogs/custom_dialog.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:fluttertemplate/Helpers/open_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:lottie/lottie.dart';

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
        child: MainColumn(context),
      )),
    );
  }

  Column MainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lineSection(),
        headingSection(),
        aboutUsSection(),
        lineSection(),
        contactUsSection(),
        lineSection(),
        termsandConditionsSection(),
        lineSection(),
        privacyPolicySection(),
        customerSupportSection(),
        lineSection(),
        logoutSection(),
        lineSection(),
        deleteUserDataSection(context),
        lineSection(),
      ],
    );
  }

  Container headingSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 12, 12),
      child: Text("Help & Support",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlack.withOpacity(0.7))),
    );
  }

  Container lineSection() {
    return Container(
      height: 1,
      margin: EdgeInsets.fromLTRB(16, 2, 2, 12),
      color: Color(0xfff2f2f2),
    );
  }

  InkWell aboutUsSection() {
    return InkWell(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ActColHome()),
        // ),
        OpenHelper.openUrl("https://btechtraders.com"),
        // GlobalSnackBar.show(context, "Coming Soon...")
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/about.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("About Us", style: Constants.buttonTextStyle),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell contactUsSection() {
    return InkWell(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ActColHome()),
        // ),
        OpenHelper.openUrl("https://btechtraders.com/contact-us/"),
        // GlobalSnackBar.show(context, "Coming Soon...")
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/feedback.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("App Feedback",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightBlack)),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell termsandConditionsSection() {
    return InkWell(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ActColHome()),
        // ),
        OpenHelper.openUrl("https://btechtraders.com"),
        // GlobalSnackBar.show(context, "Coming Soon...")
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/terms.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("Terms & Conditions",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightBlack)),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell privacyPolicySection() {
    return InkWell(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ActColHome()),
        // ),
        OpenHelper.openUrl("https://btechtraders.com/terms-and-conditions"),
        // GlobalSnackBar.show(context, "Coming Soon...")
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/privacy.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("Privacy Policy",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightBlack)),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell logoutSection() {
    return InkWell(
      onTap: () => {
        GlobalSnackBarGet().showGetSucess("Sucess", "Logout Sucessfully"),
        AuthService().signOut()
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/logout.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("Log out",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffe83068))),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell deleteUserDataSection(BuildContext context) {
    return InkWell(
      onTap: () {
        // Cancel application
        DialogUtils().showCustomDialogAnimated(
            context,
            "Delete Data",
            "Do you want to delete user data?",
            "Delete",
            "Cancel",
            deleteUserDataRTD,
            cancelFunction);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/deletu.svg"),
                SizedBox(
                  width: 16,
                ),
                Text("Delete User Data",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffe83068))),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }

  InkWell customerSupportSection() {
    return InkWell(
      onTap: () => {
        // ignore: deprecated_member_use
        launch("tel://+91123456789"),
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
        padding: EdgeInsets.all(12),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffeff9ff),
        ),
        child: Row(
          children: [
            Container(
              height: 56,
              width: 56,
              child: SvgPicture.asset("assets/images/shield.svg"),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Customer Support",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Text(
                      "Give a call to enquire about templates, flutter courses and all your doubts",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteUserDataRTD() {
    Navigator.pop(context);
    GlobalSnackBarGet().showGetSucess("Sucess", "Logout Sucessfully");
    //Delete the userinfo
    DatabaseWriteService().deleteFromRTD(
        "totalusers/" + FirebaseAuth.instance.currentUser!.uid.toString(),
        false);
    AuthService().signOut();
  }

  cancelFunction() {
    Navigator.pop(context);
  }
}
