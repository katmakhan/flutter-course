// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_gallery.dart';
import 'package:get/get.dart';

class gallery_Controller extends GetxController {
  List<Dm_Gallery> gallerycatlist = List<Dm_Gallery>.empty(growable: true).obs;
  var isLoading = true.obs;

  void fetch_gallerycat(String category) async {
    print("Fetching in the gallery category..$category");
    try {
      isLoading(true);
      var datalist =
          await DatabaseReadService().getSpecific_GalleryCatList(category);
      if (datalist != null) {
        isLoading(false);
        print("Total gallery cat is : ${datalist.length}");

        gallerycatlist.assignAll(datalist.toList());
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    //Maybe you can assing the list in init, so that fetches the first database
    //And set the total category list is some variable
    super.onInit();
  }
}
