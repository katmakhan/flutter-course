// ignore_for_file: camel_case_types

import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_Refferer_Controller extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController nameController, mobileController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
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
      begin_upload(context);
    }

    signupFormKey.currentState!.save();

    return isValid;
  }

  Future<bool> begin_upload(BuildContext context) async {
    // // check if its firebase link
    // if (pdfController.text.contains(".pdf")) {
    //   print("PDF file to upload is: ${pdfController.text}");
    //   int bytes = await File(pdfController.text).length();
    //   if (bytes >= Constants.MAX_PDF_SIZE) {
    //     GlobalSnackBarGet()
    //         .showGetError("Error", Constants.MAX_PDF_SIZE_MESSAGE);

    //     return false;
    //   }
    // }
    // customalert().showLoaderDialog(context, "Adding the refer data");
    // String subpath = path + "/";
    // bool upload = await UploadHelperIMGPDF().UploadJpgwithBytes(
    //     imgController, context, subpath, fileinbytes, filename);
    // if (!upload) {
    //   // Loader remove
    //   Navigator.pop(context);
    //   return false;
    // }

    CustomAlert().showLoaderDialog(context, "Adding the refer data");

    // generate the pdf model
    generateReffererModel();

    // Loader remove
    Navigator.pop(context);

    // Pop the main page
    Navigator.pop(context);

    return true;
  }

  void generateReffererModel() async {
    //Getting strings
    // String name = nameController.text;
    // var mobile = mobileController.text;

    // // Generating the model
    // dm_referred refferer = new dm_referred();
    // refferer.rName = name;
    // refferer.rPNum = mobile;
    // refferer.rStatus = "pending";

    // refferer.timeinmill = Date_Conversions().getTimeinmill();
    // refferer.date = Date_Conversions().getCurrentDate("dd/MM/yyyy");
    // refferer.time = Date_Conversions().getCurrentDate("HH:mm");

    // String suid = FirebaseAuth.instance.currentUser!.uid.toString();
    // refferer.rReferredby = suid;

    // Uploading to the gallery
    // var success =
    //     await DatabaseWriteService().updateToRefferaFriend(refferer, suid);
  }
}
