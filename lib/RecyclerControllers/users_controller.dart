import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  List<Dm_User> userList = List<Dm_User>.empty(growable: true).obs;
  var isLoading = true.obs;

  void fetch_allusers() async {
    try {
      isLoading(true);
      var datalist = await DatabaseReadService().getUsersList();
      if (datalist != null) {
        isLoading(false);
        print("Total users is: ${datalist.length}");
        userList.assignAll(datalist.reversed.toList());
      }
    } catch (e) {
      GlobalSnackBarGet().showGetError("Error", "Database Error");
      print("Database error $e");
    } finally {
      isLoading(false);
    }
  }

  // Sometimes you need to init the database calls, to prefetch things
  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
