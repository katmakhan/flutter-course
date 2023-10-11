import 'package:fluttertemplate/Dropdown/single_dropdown.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:fluttertemplate/Login_Signup/otp.dart';
import 'package:fluttertemplate/Login_Signup/signup.dart';
import 'package:fluttertemplate/Onboarding/onboarding.dart';
// import 'package:fluttertemplate/OnboardingNew/onboarding_new.dart';
import 'package:fluttertemplate/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const Homepage(null);
            // return const OnBoardingNew();
          } else {
            return const Onboarding();
          }
        });
  }

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      GlobalSnackBarGet().showGetError("Error", "Something went wrong");
      print("error login$e");
    }
  }

  signInWithMobileOTP(bool loading, String number, context) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      // phoneNumber: '+44 7123 123 456',
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        loading = false;
        GlobalSnackBarGet().showGetSucess("Sucess", "OTP Verified");
        FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loading = false;
        if (e.code == 'invalid-phone-number') {
          GlobalSnackBarGet().showGetError("Error", 'Invalid Mobile Number');
        } else {
          print("Error is: ${e.message}");
          GlobalSnackBarGet().showGetError("Error", e.message.toString());
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        Singup.verifiId = verificationId;
        GlobalSnackBarGet().showGetSucess(
            "Sucess", 'Code sucessfully to mobile number $number');

        //Go to OTP entering Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTP(number)),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // GlobalSnackBarGet()
        //     .showGetError("Error", 'Code auto retrieval timeout');
      },
    );
  }

  verifyOtp(smsCode, context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: Singup.verifiId, smsCode: smsCode!);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      GlobalSnackBarGet().showGetSucess("Sucess", "Sucesssfully Logged In");

      //Login to homepage
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => Register()),
      //     (Route<dynamic> route) => false);
    } catch (e) {
      if (e.toString().contains("invalid-verification-code")) {
        GlobalSnackBarGet().showGetError("Error", "Invalid OTP");
      } else {
        GlobalSnackBarGet().showGetError("Error", "Something went wrong");
      }
    }
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
