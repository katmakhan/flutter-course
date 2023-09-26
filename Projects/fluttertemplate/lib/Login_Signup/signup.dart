import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);

  static String verifiId = "";
  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  String? _mobnumber;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginbg.png"),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbutton(),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 0, 4),
                child: const Text(
                  "Enter your phone number",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 2, 0, 8),
                child: Text(
                  "We will send a confirmation code to your phone number",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackwithClass.withOpacity(0.6)),
                ),
              ),
              // Container(
              //   // height: 50,
              //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //   // width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     color: Colors.white,
              //     border: Border.all(color: Color(0xffe0e0e0), width: 0.6),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              //     child: TextFormField(
              //       maxLines: 1,
              //       style: TextStyle(
              //           fontFamily: "Poppins",
              //           fontWeight: FontWeight.w500,
              //           fontSize: 14,
              //           color: Color(0xFF424242)),
              //       decoration: InputDecoration(
              //         floatingLabelBehavior: FloatingLabelBehavior.never,
              //         border: InputBorder.none,
              //         labelStyle: TextStyle(
              //             fontFamily: "Poppins",
              //             fontWeight: FontWeight.w500,
              //             fontSize: 12,
              //             color: Color(0xFFBBBBBB)),
              //         labelText: "Phone Number",
              //         // prefixIcon: Icon(Icons.email),
              //       ),
              //       keyboardType: TextInputType.phone,
              //       // controller: controller.nameController,
              //       onChanged: (value) {
              //         // controller.nameController.text = value!;
              //         _mobnumber = value;
              //       },
              //       validator: (value) {
              //         if (!GetUtils.isPhoneNumber(value.toString())) {
              //           return "Phone Number must be 10 Digits";
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.all(16),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);

                    //  if (!GetUtils.isPhoneNumber(phone.completeNumber.toString())) {
                    //     return "Phone Number must be 10 Digits";
                    //   }
                    //   return null;

                    _mobnumber = phone.completeNumber;
                  },
                ),
              ),
              InkWell(
                onTap: () => {
                  print("Mobile number is: ${_mobnumber.toString().trim()}"),
                  loading
                      ? GlobalSnackBarGet()
                          .showGetError("loading", "please wait")
                      : AuthService().signInWithMobileOTP(
                          loading, _mobnumber.toString().trim(), context),
                  loading = true,
                  setState(() {}),
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  decoration: BoxDecoration(
                    gradient: Constants.mainlinearGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Center(
                          child: Text("Send OTP",
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
    ));
  }

  InkWell backbutton() {
    return InkWell(
      onTap: () => {Navigator.pop(context)},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: SvgPicture.asset("assets/images/backbtn.svg")),
        ],
      ),
    );
  }
}
