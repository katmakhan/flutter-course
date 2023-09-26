import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class UploadHelper {
  Future<String?> uploadFile(File file, String path, String filename) async {
    print("Uploading the image $filename to $path");
    try {
      path = path + filename;
      await FirebaseStorage.instance.ref(path).putFile(file);
      String downloadURL =
          await FirebaseStorage.instance.ref(path).getDownloadURL();

      return downloadURL;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> uploadFileinBytes(Uint8List fileinbytes, String path,
      String filename, String extension) async {
    print("Uploading the image $filename to $path");
    try {
      final metadata = SettableMetadata(
        contentType: extension,
      );

      path = path + filename;
      await FirebaseStorage.instance.ref(path).putData(fileinbytes, metadata);
      String downloadURL =
          await FirebaseStorage.instance.ref(path).getDownloadURL();

      print("File url is $downloadURL");
      return downloadURL;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }
}
