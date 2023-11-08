import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPDF {
  static Future<void> downLoadPDF(String linkurl, String filename) async {
    // final appstorage = await getDownloadsDirectory();
    // print("Downloading the link " + linkurl);
    // print("Saving the file as " + filename);

    var file = File('');
    final dir = await getApplicationDocumentsDirectory();
    file = File('${dir.path}/$filename.pdf');

    try {
      final response = await Dio().get(linkurl,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print("Something went wrong while downloading pdf");
    }

    // OpenFile.open(file.path);
  }

  // static Future<void> saveFile(String fileName) async {
  //   var file = File('');

  //   // Platform.isIOS comes from dart:io
  //   if (Platform.isIOS) {
  //     final dir = await getApplicationDocumentsDirectory();
  //     file = File('${dir.path}/$fileName');
  //   }
  //   if (Platform.isAndroid) {
  //     var status = await Permission.storage.status;
  //     if (status != PermissionStatus.granted) {
  //       status = await Permission.storage.request();
  //     }
  //     if (status.isGranted) {
  //       const downloadsFolderPath = '/storage/emulated/0/Download/';
  //       Directory dir = Directory(downloadsFolderPath);
  //       file = File('${dir.path}/$fileName');
  //     }
  //   }
  // }
}
