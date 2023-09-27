import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/onboarding/walk1.png"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                  // width: MediaQuery.of(context).size.width,
                  height: 310,
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF343C47).withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset("assets/icons/google.png", height: 100),
                      SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Flutter Templates",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          // foreground: Paint()
                          //   ..shader = LinearGradient(
                          //     colors: <Color>[
                          //       Color(0xffBB0909),
                          //       Color(0xffDD8705)

                          //       //add more color here.
                          //     ],
                          //   ).createShader(
                          //       Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Login with gmail and become part of the vast flutter template",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1c1c1c).withOpacity(0.3),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () => {
                          AuthService().signInWithGoogle()

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Homepage()),
                          // ),
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(20, 16, 20, 4),
                          height: 45,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffff4b26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 15,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/insta.svg"),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Login using Google",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFFFFFFFF)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
