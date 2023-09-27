import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Login_Signup/login.dart';
import 'package:fluttertemplate/Login_Signup/signup.dart';
import 'package:fluttertemplate/Onboarding/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _dotcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _dotcontroller,
          children: const [
            IntroPage(
                heading: "LEARN\nFLUTTER\nFROM SCRATCH",
                imageloc: "assets/onboarding/walk1.png"),
            IntroPage(
                heading: "CHOOSE FROM\nCOOL 500+ \nTEMPLATES",
                imageloc: "assets/onboarding/walk2.png"),
            IntroPage(
                heading: "DOWNLOAD\nCODE FOR YOUR\nFAVOURITE\nDESIGNS",
                imageloc: "assets/onboarding/walk3.png"),
          ],
        ),
        //dot indicator
        Container(
            alignment: const Alignment(-0.9, 0.5),
            child: SmoothPageIndicator(
              controller: _dotcontroller,
              count: 3,
              effect: const WormEffect(
                dotWidth: 14.0,
                dotHeight: 14.0,
                dotColor: Color(0xff6F7173),
                activeDotColor: AppColors.primaryColor,
              ),
            )),
        Align(
            alignment: const Alignment(0, 0.1),
            child: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      ),
                    },
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        ),
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 16),
                        decoration: BoxDecoration(
                          gradient: Constants.mainlinearGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("LOGIN",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Singup()),
                          ),
                        },
                        child: Text("  Register ",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.primaryColor)),
                      ),
                      Text(
                        "now!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.white),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
