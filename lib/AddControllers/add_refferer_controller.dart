// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:io';

import 'package:fluttertemplate/DB_Services/upload_helper.dart';
import 'package:fluttertemplate/DB_Services/upload_service.dart';
import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_Refferer_Controller extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      mobileController,
      pdfController,
      imageController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    pdfController = TextEditingController();
    imageController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    pdfController.dispose();
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
      begin_upload(context);
    }

    signupFormKey.currentState!.save();

    return isValid;
  }

  Future<bool> begin_upload(BuildContext context) async {
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

  Future<bool> uploadPdf(context, journal) async {
    // check if its firebase link, to check if it's already uploaded

    if (pdfController.text.contains(".pdf")) {
      print("PDF file to upload is: ${pdfController.text}");
      int bytes = await File(pdfController.text).length();
      if (bytes >= Constants.MAX_PDF_SIZE) {
        GlobalSnackBarGet()
            .showGetError("Error", Constants.MAX_PDF_SIZE_MESSAGE);

        return false;
      }
    }
    CustomAlert().showLoaderDialog(context, "Uploading the pdf");

    // FIlename and Path should be assinged here
    String mainpath = "";
    String subpath = "";
    String filename = "";
    bool upload = await UploadHelperIMGPDF()
        .uploadPDF(pdfController, context, mainpath, subpath, filename);
    if (!upload) {
      // Loader remove
      Navigator.pop(context);
      return false;
    }

    return true;
  }

  Future<bool> uploadImage(context, courses) async {
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
        .uploadFile(File(imageController.text), "courseImage/", courses);

    if (result.toString() != "null") {
      GlobalSnackBarGet().showGetSucess("Sucess", "Image Uploaded");
      imageController.text = result.toString();
    } else {
      GlobalSnackBarGet().showGetError("Error", "Image couldnt be uploaded");
    }

    return true;
  }
}
