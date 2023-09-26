import 'package:fluttertemplate/DB_Services/database_read.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  List<Dm_User> userList = List<Dm_User>.empty(growable: true).obs;
  var isLoading = true.obs;

  void fetchallReferals() async {
    try {
      isLoading(true);
      var datalist = await DatabaseReadService().getUsersList();
      if (datalist != null) {
        isLoading(false);
        print(datalist.length);
        userList.assignAll(datalist.reversed.toList());
      }
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
