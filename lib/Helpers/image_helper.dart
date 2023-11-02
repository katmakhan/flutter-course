// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';
import 'package:fluttertemplate/DB_Services/database_write.dart';
import 'package:fluttertemplate/DB_Services/upload_service.dart';
import 'package:fluttertemplate/DataModels/dm_gallery.dart';
import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/filesize_helper.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  Future<bool> pickSingleImage(TextEditingController imgController) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
      if (pickedFile == null) {
        return false; // No image was picked, return early
      }
      final imageFile = File(pickedFile.path);
      imgController.text = imageFile.path;
      return true;
    } catch (e) {
      GlobalSnackBarGet().showGetError("Error", "Invalid file type");
      return false;
    }
  }

  Future<String?> pickSingleImage_directly() async {
    // PickedFile? pickedFile = await ImagePicker()
    //     .getImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
    // if (pickedFile != null) {
    //   File imageFile = File(pickedFile.path);
    //   return imageFile.path;
    // }
    return null;
  }

  Future<bool> upload_singleImage(BuildContext context, String imagefilepath,
      String filename, String cat) async {
    // check if its firebase link
    if (imagefilepath.contains(".jpg") ||
        imagefilepath.contains(".jpeg") ||
        imagefilepath.contains(".png")) {
      print("Image file to upload is: $imagefilepath");
      int bytes = await File(imagefilepath).length();
      String filesize = await FilesizeHelper().getFileSize(imagefilepath, 2);
      print("File size is: $bytes");
      if (bytes >= Constants.MAX_IMAGE_SIZE) {
        GlobalSnackBarGet().showGetError("Error",
            "${Constants.MAX_IMAGE_SIZE_MESSAGE}.\nCompressed image size is $filesize");

        return false;
      }
    }

    CustomAlert().showLoaderDialog(context, "Uploading the image.");

    if (imagefilepath.contains(".jpg") ||
        imagefilepath.contains(".jpeg") ||
        imagefilepath.contains(".png")) {
      var result = await UploadHelperFirebase()
          .uploadFile(File(imagefilepath), "gallery/$cat/", filename);

      if (result.toString() != "null") {
        GlobalSnackBarGet().showGetSucess("Sucess", "Image Uploaded");
        imagefilepath = result.toString();
      } else {
        GlobalSnackBarGet().showGetError("Error", "Image couldnt be uploaded");
      }
    }

    // generate the pdf model
    generateGallerymodel(imagefilepath, cat);

    // Loader remove
    Navigator.pop(context);

    // Pop the main page
    // Navigator.pop(context);
    return true;
  }

  void generateGallerymodel(String imagefilepath, String category) {
    Dm_Gallery gallery = Dm_Gallery();
    gallery.imgurl = imagefilepath;

    DatabaseWriteService().addToGallery(category, gallery);
  }
}

//   void pickMultipleImage() async {
//     //  // Pick multiple images
//     // final List<XFile>? images = await _picker.pickMultiImage();

//     // PickedFile pickedFile = await ImagePicker().getImage(
//     //     // source: ImageSource.gallery,
//     //     maxWidth: 1800,
//     //     maxHeight: 1800,
//     // );
//     // if (pickedFile != null) {
//     //     File imageFile = File(pickedFile.path);
//     // }

//   }
// }
