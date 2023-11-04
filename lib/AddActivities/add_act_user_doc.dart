import 'package:flutter/material.dart';
import 'package:fluttertemplate/AddControllers/add_user_document_controller.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Components/appbar.dart';
import 'package:fluttertemplate/Components/cust_button.dart';
import 'package:fluttertemplate/Components/form_field_large.dart';
import 'package:fluttertemplate/Components/upload_pdf_button.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:get/get.dart';

class ActAddUserDocuments extends StatefulWidget {
  final bool isedit;
  final Dm_User? user;
  const ActAddUserDocuments(this.isedit, this.user, {Key? key})
      : super(key: key);

  @override
  State<ActAddUserDocuments> createState() => _ActAddUserDocumentsState();
}

class _ActAddUserDocumentsState extends State<ActAddUserDocuments> {
  //List<Widget> textFormFields = [];

  final Add_User_Document_Controller controller =
      Get.put(Add_User_Document_Controller());

  bool pdf_added = false;
  String pdffilename = "";
  @override
  Widget build(BuildContext context) {
    assign_allvalues();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppbar(
            title: widget.isedit ? 'Edit User Document' : "Add User Document"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              children: [
                const Cust_Form_field_big(
                  cus_label: "Name",
                  hintText: 'User name',
                  keyboardType: TextInputType.text,
                  // validator: () => {},
                ),
                const Cust_Form_field_big(
                  cus_label: "Bio",
                  hintText: 'Describe about yourself',
                  keyboardType: TextInputType.text,
                  // validator: () => {},
                ),
                uploadPdf(controller.pdfController, pdf_added, changePdfFile,
                    pdffilename),
                Cust_Button(
                  custtext: widget.isedit ? "Edit Document" : 'Add Document',
                  onTap: () =>
                      {controller.checkUpload(context, pdffilename, true)},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void assign_allvalues() {
    if (widget.user != null) {
      controller.usernameController.text = widget.user!.name.toString();
    }
  }

  void changePdfFile(bool pdf_added_updated, String filename) {
    pdf_added = pdf_added_updated;
    pdffilename = filename;
    setState(() {});
  }
}
