import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/AddControllers/add_user_image_controller.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Components/appbar.dart';
import 'package:fluttertemplate/Components/cust_button.dart';
import 'package:fluttertemplate/Components/form_field_large.dart';
import 'package:fluttertemplate/Components/upload_image_button.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:get/get.dart';

class ActAddUserImage extends StatefulWidget {
  final bool isedit;
  final Dm_User? user;
  const ActAddUserImage(this.isedit, this.user, {Key? key}) : super(key: key);

  @override
  State<ActAddUserImage> createState() => _ActAddUserImageState();
}

class _ActAddUserImageState extends State<ActAddUserImage> {
  //List<Widget> textFormFields = [];

  final Add_User_Image_Controller controller =
      Get.put(Add_User_Image_Controller());

  bool photo_added = false;
  @override
  Widget build(BuildContext context) {
    assign_allvalues();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppbar(
            title: widget.isedit ? 'Edit User Image' : "Add User Image"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              children: [
                uploadPhotoButton(
                    controller.imageController,
                    photo_added,
                    FirebaseAuth.instance.currentUser!.photoURL.toString(),
                    changePhotoImage),
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
                Cust_Button(
                  custtext:
                      widget.isedit ? "Edit User Image" : 'Add User Image',
                  onTap: () => {controller.checkUpload(context, true)},
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

  void changePhotoImage(bool photo_added_updated) {
    photo_added = photo_added_updated;
    setState(() {});
  }
}
