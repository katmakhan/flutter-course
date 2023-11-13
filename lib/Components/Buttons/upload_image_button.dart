import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/image_helper.dart';

InkWell uploadPhotoButton(TextEditingController imgController, bool photo_added,
    String img_url, Function changePhotoImage) {
  // print("Current selected image is: " +
  //     controller.imgController.text.toString());
  return InkWell(
    onTap: () async {
      if (await ImageHelper().pickSingleImage(imgController)) {
        photo_added = true;
        changePhotoImage(photo_added);
      }
      // MemberReg_Controller().showLoaderDialog(context)
    },
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4, top: 16),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: !photo_added
                    ? NetworkImage(img_url.toString())
                    : FileImage(File(imgController.text.toString()))
                        as ImageProvider,
                fit: BoxFit.cover),
          ),
        ),
        const Text(
          "Change Photo",
          style: TextStyle(
              fontSize: 12,
              color: Color(0xff9e00ff),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}
