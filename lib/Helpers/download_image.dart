import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'dart:ui' as ui;

class DownloadImage {
  Future saveImage(Uint8List pngBytes, filename) async {
    // final appstorage = await getDownloadsDirectory();
    final appstorage = Directory('/storage/emulated/0/Download');
    // String filename = "kcymidcard";
    final file = File('${appstorage.path}/$filename.png');
    file.writeAsBytes(pngBytes);
    print("Succesfully downloaded..");

    OpenFile.open(file.path);
  }

  Future capturePng(GlobalKey globalKey, filename) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);

    saveImage(pngBytes, filename);
    // var file = await writeFile(pngBytes, 'kcymidcard.png');
  }

  // Future<File> writeFile(Uint8List data, String name) async {
  //   // storage permission ask
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //   // the downloads folder path
  //   final tempDir = Directory('/storage/emulated/0/Download');
  //   String tempPath = tempDir.path;
  //   var filePath = tempPath + '/$name';
  //   //

  //   // the data
  //   var bytes = ByteData.view(data.buffer);
  //   final buffer = bytes.buffer;
  //   // save the data in the path
  //   return File(filePath).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }
}
