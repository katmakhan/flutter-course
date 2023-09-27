import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTP extends StatefulWidget {
  final String number;
  OTP(this.number, {Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String? smsCode;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          unselectedWidgetColor: Color(0xffe0e0e0),
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff1d98f0)),
      home: Scaffold(
          body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/png_bg/loginbg.png"),
                      fit: BoxFit.cover)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: Container(
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: SvgPicture.asset("assets/svg/backbtn.svg")),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Text(
                    "Signup",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 0, 4),
                  child: Text(
                    "Verify OTP",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 2, 0, 8),
                  child: Text(
                    "We have sent a 6-digit OTP to your mobile number",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackwithClass.withOpacity(0.6)),
                  ),
                ),
                SizedBox(height: 20),
                OTPTextField(
                  onChanged: (value) => {smsCode = value},
                  margin: EdgeInsets.fromLTRB(4, 8, 4, 12),
                  width: MediaQuery.of(context).size.width,
                  length: 6,
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldWidth: 45,
                  spaceBetween: 4,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 5,
                  otpFieldStyle: OtpFieldStyle(
                    focusBorderColor: Color(0xFF58B85F),
                    backgroundColor: Color(0xFFFFFFFF),
                    borderColor: Color(0xffe0e0e0).withOpacity(0.6),
                    //(here)
                  ),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF424242)),
                ),
                Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 25, top: 8),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF343c47),
                          decoration: TextDecoration.underline),
                    )),
                SizedBox(height: 5),
                InkWell(
                  onTap: () async {
                    if (smsCode != null) {
                      if (loading) {
                        GlobalSnackBarGet()
                            .showGetError("Loading", 'please wait');
                      } else {
                        loading = true;
                        setState(() {});
                        try {
                          // PhoneAuthCredential credential =
                          //     PhoneAuthProvider.credential(
                          //         verificationId: Singup.verifiId,
                          //         smsCode: smsCode!);

                          AuthService().verifyOtp(smsCode, context);

                          // var success = await FirebaseAuth.instance
                          //     .signInWithCredential(credential);

                          // GlobalSnackBarGet()
                          //     .showGetSucess("Sucess", 'OTP Verified');

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Homepage()),
                          // );
                        } catch (e) {
                          loading = false;
                          GlobalSnackBarGet()
                              .showGetError("Error", 'InValid OTP');
                        }
                      }
                    } else {
                      loading = false;
                      GlobalSnackBarGet()
                          .showGetError("Error", 'Enter Valid OTP');
                    }
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 16),
                    decoration: BoxDecoration(
                      gradient: Constants.mainlinearGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Center(
                            child: Text("Verify OTP",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
