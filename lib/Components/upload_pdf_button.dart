import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';

InkWell uploadPdf(TextEditingController pdfController, bool pdfselected,
    Function changePdf, String pdffilename) {
  // String pdffilename = "";
  return InkWell(
    onTap: () async {
      //With parameters:
      FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
        // allowedFileExtensions: ['pdf', 'doc', 'docx'],
        invalidFileNameSymbols: ['/'],
      );

      try {
        final path = await FlutterDocumentPicker.openDocument(params: params);
        print(path);
        if (path != null) {
          File file = File(path);
          pdfController.text = path;
          pdfselected = true;
          pdffilename = p.basename(file.path);
          print("Selected File is $pdffilename");
          changePdf(pdfselected, pdffilename);
          // setState(() {});
        } else {
          pdfselected = false;
          // setState(() {});
          changePdf(pdfselected, pdffilename);
          GlobalSnackBarGet().showGetError("Choose file", "No File Selected");
        }
      } catch (e) {
        GlobalSnackBarGet().showGetError("Error", "Invalid filetype");
      }
    },
    child: Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 4),
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: const Color(0xffe0e0e0), width: 0.6),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: TextFormField(
          enabled: false,
          maxLines: 1,
          style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 5,
              color: Color(0xFF424242)),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: InputBorder.none,
            labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: Color(0xFFBBBBBB)),
            labelText: pdfselected ? pdffilename : "Upload PDF",
            prefixIcon: pdfselected ? const Icon(Icons.done) : null,
          ),
          // keyboardType: TextInputType.text,
          // controller: controller.pdfController,
          // onSaved: (value) {
          //   controller.pdfController.text = value!;
          // },
          // validator: (value) {
          //   return controller.validateEmail(value!);
          // },
        ),
      ),
    ),
  );
}
