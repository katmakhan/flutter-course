import 'dart:io';
import 'package:fluttertemplate/DB_Services/upload_service.dart';
import 'package:fluttertemplate/Dialogs/custom_alert.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:fluttertemplate/Helpers/filesize_helper.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:flutter/material.dart';

class UploadHelperIMGPDF {
  Future<bool> uploadPDF(
      TextEditingController pdfController,
      BuildContext context,
      String mainpath,
      String subpath,
      String filename) async {
    bool isdone = false;

    // check if its firebase link
    if (pdfController.text.toString().contains("firebase")) {
      // Replace, Delete, Overwrite logic
    }

    //Check if its PDF extesion
    if (pdfController.text.endsWith(".pdf")) {
      print("PDF file to upload is: ${pdfController.text}");
      int bytes = await File(pdfController.text).length();
      if (bytes >= Constants.MAX_PDF_SIZE) {
        GlobalSnackBarGet()
            .showGetError("Error", Constants.MAX_PDF_SIZE_MESSAGE);
        return false;
      }
    } else {
      GlobalSnackBarGet()
          .showGetError("Error", "Invalid File type for pdf $filename");
      return false;
    }

    // ignore: use_build_context_synchronously
    CustomAlert().showLoaderDialog(context, "Uploading the pdf");

    var result = await UploadHelperFirebase().uploadFile(
        // File(pdfController.text), "downloads/" + cat + "/", filename);
        File(pdfController.text),
        mainpath + subpath,
        filename);

    if (result.toString() != "null") {
      GlobalSnackBarGet().showGetSucess("Sucess", "PDF Uploaded");
      pdfController.text = result.toString();
      isdone = true;
      // Loader remove
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      GlobalSnackBarGet().showGetError("Error", "PDF couldnt be uploaded");
      // Loader remove
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      return false;
    }

    return isdone;
  }

  Future<bool> uploadJPG(
      TextEditingController imgController,
      BuildContext context,
      String mainpath,
      String subpath,
      String filename) async {
    bool isdone = false;

    // check if its firebase link
    if (imgController.text.toString().contains("firebase")) {
      // Replace, Delete, Overwrite logic
    }
    print("Checking the path in ${imgController.text}");

    // Check Extension
    String imgextension = imgController.text.toString().split(".").last;
    print("Extension is $imgextension");

    // Check Image Extension Function
    bool val = await checkExtensionImage(imgextension, imgController, filename);
    if (!val) {
      return false;
    }

    // ignore: use_build_context_synchronously
    CustomAlert().showLoaderDialog(context, "Uploading the image");

    // Main function to upload
    var result = await UploadHelperFirebase()
        .uploadFile(File(imgController.text), "$mainpath/$subpath/", filename);

    if (result.toString() != "null") {
      GlobalSnackBarGet().showGetSucess("Sucess", "Image Uploaded");
      imgController.text = result.toString();
      isdone = true;

      // Loader remove
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      GlobalSnackBarGet().showGetError("Error", "Image couldnt be uploaded");

      // Loader remove
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      return false;
    }
    return isdone;
  }

  checkExtensionImage(String imgextension, TextEditingController imgController,
      String filename) async {
    if (imgextension == "jpg" ||
        imgextension == "jpeg" ||
        imgextension == "png") {
      print("Image file to upload is: ${imgController.text}");
      int bytes = await File(imgController.text).length();
      String filesize =
          await FilesizeHelper().getFileSize(imgController.text, 2);
      if (bytes >= Constants.MAX_IMAGE_SIZE) {
        GlobalSnackBarGet().showGetError("Error",
            "${Constants.MAX_IMAGE_SIZE_MESSAGE}.\nCompressed image size is $filesize");
        return false;
      }
    } else {
      GlobalSnackBarGet()
          .showGetError("Error", "Invalid File type for image $filename");
      return false;
    }
  }

  // Future<bool> UploadpdfwithBytes(BuildContext context, String mainpath,
  //     String subpath, Uint8List fileinbytes, String filename) async {
  //   bool isdone = false;

  //   // check if its firebase link
  //   // if (pdfController.text.contains(".pdf")) {
  //   //   print("PDF file to upload is: ${pdfController.text}");
  //   //   int bytes = await File(pdfController.text).length();
  //   //   if (bytes >= Constants.MAX_PDF_SIZE) {
  //   //     GlobalSnackBarGet()
  //   //         .showGetError("Error", Constants.MAX_PDF_SIZE_MESSAGE);
  //   //     return false;
  //   //   }
  //   // }

  //   customalert().showLoaderDialog(context, "Uploading the doc");

  //   // if (pdfController.text.contains(".pdf")) {
  //   //   var result = await Upload_helper().uploadFile(
  //   //       // File(pdfController.text), "downloads/" + cat + "/", filename);
  //   //       File(pdfController.text),
  //   //       mainpath + subpath,
  //   //       filename);

  //   //   if (result.toString() != "null") {
  //   //     GlobalSnackBarGet().showGetSucess("Sucess", "PDF Uploaded");
  //   //     pdfController.text = result.toString();
  //   //     isdone = true;
  //   //     // Loader remove
  //   //     Navigator.pop(context);
  //   //   } else {
  //   //     GlobalSnackBarGet().showGetError("Error", "PDF couldnt be uploaded");
  //   //     // Loader remove
  //   //     Navigator.pop(context);
  //   //     return false;
  //   //   }
  //   // }

  //   return isdone;
  // }

  //JPG with Bytes
  // Future<bool> UploadJpgwithBytes(
  //     TextEditingController imgController,
  //     BuildContext context,
  //     String subpath,
  //     Uint8List fileinbytes,
  //     String filename) async {
  //   bool isdone = false;

  //   String? imgextension = lookupMimeType('', headerBytes: fileinbytes);
  //   print("Extension is " + imgextension!);
  //   if (imgextension == "image/jpeg" || imgextension == "image/png") {
  //     int bytes = fileinbytes.lengthInBytes;
  //     String filesize =
  //         await FilesizeHelper().getFileSizefromBytes(fileinbytes, 2);
  //     if (bytes >= Constants.MAX_IMAGE_SIZE) {
  //       GlobalSnackBarGet().showGetError(
  //           "Error",
  //           Constants.MAX_IMAGE_SIZE_MESSAGE +
  //               ".\nCompressed image size is " +
  //               filesize);
  //       // Loader remove
  //       Navigator.pop(context);
  //       return false;
  //     }
  //   } else {
  //     GlobalSnackBarGet().showGetError("Error", "Invalid File type");
  //     return false;
  //   }

  //   customalert().showLoaderDialog(context, "Uploading the image");

  //   // Main function to upload
  //   var result = await Upload_helper()
  //       .uploadFileinBytes(fileinbytes, subpath + "/", filename, 'image/jpeg');

  //   if (result.toString() != "null") {
  //     GlobalSnackBarGet().showGetSucess("Sucess", "Image Uploaded");
  //     imgController.text = result.toString();
  //     isdone = true;

  //     // Loader remove
  //     Navigator.pop(context);
  //   } else {
  //     GlobalSnackBarGet().showGetError("Error", "Image couldnt be uploaded");

  //     // Loader remove
  //     Navigator.pop(context);

  //     return false;
  //   }
  //   return isdone;
  // }

  // //PDF with Bytes
  // Future<bool> UploadPdfwithBytes(
  //     TextEditingController imgController,
  //     BuildContext context,
  //     String subpath,
  //     Uint8List fileinbytes,
  //     String filename) async {
  //   bool isdone = false;

  //   String? imgextension = lookupMimeType('', headerBytes: fileinbytes);
  //   print("Extension is " + imgextension!);
  //   if (imgextension == "application/pdf") {
  //     int bytes = fileinbytes.lengthInBytes;
  //     String filesize =
  //         await FilesizeHelper().getFileSizefromBytes(fileinbytes, 2);
  //     if (bytes >= Constants.MAX_PDF_SIZE) {
  //       GlobalSnackBarGet().showGetError(
  //           "Error",
  //           Constants.MAX_PDF_SIZE_MESSAGE +
  //               ".\nCompressed pdf size is " +
  //               filesize);
  //       // Loader remove
  //       Navigator.pop(context);
  //       return false;
  //     }
  //   } else {
  //     GlobalSnackBarGet().showGetError("Error", "Invalid File type");
  //     return false;
  //   }

  //   customalert().showLoaderDialog(context, "Uploading the pdf");

  //   // Main function to upload
  //   var result = await Upload_helper().uploadFileinBytes(
  //       fileinbytes, subpath + "/", filename, 'application/pdf');

  //   if (result.toString() != "null") {
  //     GlobalSnackBarGet().showGetSucess("Sucess", "Pdf Uploaded");
  //     imgController.text = result.toString();
  //     isdone = true;

  //     // Loader remove
  //     Navigator.pop(context);
  //   } else {
  //     GlobalSnackBarGet().showGetError("Error", "Pdf couldnt be uploaded");

  //     // Loader remove
  //     Navigator.pop(context);

  //     return false;
  //   }
  //   return isdone;
  // }
}
