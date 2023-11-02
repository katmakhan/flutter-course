// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:fluttertemplate/DB_Services/database_write.dart';
import 'package:fluttertemplate/DB_Services/upload_helper.dart';
import 'package:fluttertemplate/DB_Services/upload_service.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/date_conversion.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_UserInfo_Controller extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController,
      emailController,
      imageController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    imageController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    imageController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Phone Number must be 10 Digits";
    }
    return null;
  }

  String? validateUserName(String value) {
    if (!GetUtils.isUsername(value)) {
      return "Provide user name";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Provide a valid Name";
    }
    return null;
  }

  String? validateUrl(String value) {
    if (value.isURL) {
      return "Provide a valid url";
    }
    return null;
  }

  Future<bool> checkUpload(context) async {
    final isValid = signupFormKey.currentState!.validate();

    // check if its validated or not
    if (!isValid) {
      GlobalSnackBarGet()
          .showGetError("Not Complete", "Please fill all the details");
      return false;
    } else {
      beginUpload(context);
    }

    signupFormKey.currentState!.save();

    return isValid;
  }

  Future<bool> beginUpload(BuildContext context) async {
    // check if its firebase link
    String username = usernameController.text;

    //Uploading Image
    bool val = await uploadImage(context, username);

    CustomAlert().showLoaderDialog(context, "Adding the user data");

    // generate the pdf model
    generateUserModel();

    // Loader remove
    Navigator.pop(context);

    return true;
  }

  void generateUserModel() async {
    //Getting strings
    String name = usernameController.text;
    String email = emailController.text;

    // Generating the model
    Dm_User user = Dm_User();
    user.name = name;
    // user.sPNum = FirebaseAuth.instance.currentUser!.phoneNumber;
    user.email = email;
    user.timeinmill = Date_Conversions().getTimeinmill();
    user.date = Date_Conversions().getCurrentDate("dd/MM/yyyy");
    user.time = Date_Conversions().getCurrentDate("HH:mm");

    // String suid = FirebaseAuth.instance.currentUser!.uid.toString();

    // Updating the use data
    await DatabaseWriteService().addToUsers(user, true);
  }

  Future<bool> uploadImage(context, username) async {
    print("Image file to upload is: ${imageController.text}");
    int bytes = await File(imageController.text).length();
    if (bytes >= Constants.MAX_IMAGE_SIZE) {
      GlobalSnackBarGet()
          .showGetError("Error", Constants.MAX_IMAGE_SIZE_MESSAGE);
      return false;
    }

    GlobalSnackBarGet().showGetSucess("Sucess", "All check is complete");

    CustomAlert().showLoaderDialog(context, "Uploading the image....");

    var result = await UploadHelperFirebase()
        .uploadFile(File(imageController.text), "userImage/", username);

    if (result.toString() != "null") {
      GlobalSnackBarGet().showGetSucess("Sucess", "Image Uploaded");
      imageController.text = result.toString();
    } else {
      GlobalSnackBarGet().showGetError("Error", "Image couldnt be uploaded");
    }

    return true;
  }
}
