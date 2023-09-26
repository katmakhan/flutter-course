import 'package:fluttertemplate/AddControllers/add_userinfo_controller.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:fluttertemplate/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? _isChecked = false;
  Add_UserInfo_Controller addstudentController =
      Get.put(Add_UserInfo_Controller());

  @override
  void initState() {
    // Check if he is already registered
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkifalreadydata();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Form(
        key: addstudentController.signupFormKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/loginbg.png"),
                      fit: BoxFit.cover)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: SvgPicture.asset("assets/images/backbtn.svg")),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 0, 4),
                  child: Text(
                    "Welcome to Flutter Template",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 2, 32, 8),
                  child: Text(
                    "Please fill the following details to start looking for the templates of your dream",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackwithClass.withOpacity(0.6)),
                  ),
                ),
                Container(
                  // height: 50,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffe0e0e0), width: 0.6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: TextFormField(
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF424242)),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                        labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFFBBBBBB)),
                        labelText: "Full Name",
                        contentPadding:
                            EdgeInsets.only(top: 2, bottom: 10, left: 25),
                        // prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.name,
                      controller: addstudentController.nameController,
                      onSaved: (value) {
                        addstudentController.nameController.text = value!;
                      },
                      validator: (value) {
                        return addstudentController.validateName(value!);
                      },
                    ),
                  ),
                ),
                Container(
                  // height: 50,
                  margin: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffe0e0e0), width: 0.6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: TextFormField(
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF424242)),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email),

                        labelStyle: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFFBBBBBB)),
                        labelText: "Email ID",
                        contentPadding:
                            EdgeInsets.only(top: 2, bottom: 10, left: 25),
                        // prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: addstudentController.emailController,
                      onSaved: (value) {
                        addstudentController.emailController.text = value!;
                      },
                      validator: (value) {
                        return addstudentController.validateEmail(value!);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CheckboxListTile(
                  title: Text(
                    "I Accept to the terms & Conditions",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF343c47),
                    ),
                  ),
                  value: _isChecked,
                  tristate: false,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  checkColor: Color(0xffffffff),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                InkWell(
                  onTap: () async {
                    if (_isChecked!) {
                      bool result =
                          await addstudentController.checkUpload(context);

                      if (result) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Homepage(null)),
                            (Route<dynamic> route) => false);
                      }
                    } else {
                      GlobalSnackBarGet().showGetError(
                          "Error", 'Please accept the terms and conditions');
                    }
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 16),
                    decoration: BoxDecoration(
                      gradient: Constants.mainlinearGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Complete Registration",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ))),
    );
  }

  void checkifalreadydata() async {
    // String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    // dm_studentdetail? studentdata =
    //     await DatabaseReadService().getStudentInfo(uid);

    // // IF data is already there
    // if (studentdata!.sName.toString() != "null") {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => Homepage(null)),
    //       (Route<dynamic> route) => false);
    // }
  }
}
