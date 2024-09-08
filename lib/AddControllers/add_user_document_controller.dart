// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:fluttertemplate/DB_Services/database_write.dart';
import 'package:fluttertemplate/DB_Services/upload_helper.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/date_conversion.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_User_Document_Controller extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController, emailController, pdfController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    pdfController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    pdfController.dispose();
  }

  Future<bool> checkUpload(context, String filename, bool toclose) async {
    final isValid = signupFormKey.currentState!.validate();

    // check if its validated or not
    if (!isValid) {
      GlobalSnackBarGet()
          .showGetError("Not Complete", "Please fill all the details");
      return false;
    } else {
      beginUpload(context, filename, toclose);
    }

    signupFormKey.currentState!.save();

    return isValid;
  }

  Future<bool> beginUpload(
      BuildContext context, String filename, bool toclose) async {
    // check if its firebase link
    String username = usernameController.text;

    //Passing Variables
    String mainpath = "UserDocuments";
    String subpath = username;
    // String filename = pdfController.text;

    //Uploading Image
    bool val = await UploadHelperIMGPDF()
        .uploadPDF(pdfController, context, mainpath, subpath, filename);

    // If failed to upload, return false
    if (!val) {
      return false;
    }

    //Loader called
    CustomAlert().showLoaderDialog(context, "Adding the user data");

    // generate the pdf model
    generateUserModel();

    // Loader remove
    Navigator.pop(context);

    //Close the activity
    if (toclose) {
      Navigator.pop(context);
    }

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
}
