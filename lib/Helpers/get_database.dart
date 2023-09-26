import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Database extends GetxController {
  final data = GetStorage();

  void storeProfileID(String profileId) {
    data.write('name', profileId);
  }

  String getpetID() {
    return data.read("name");
  }

  Future<void> initStorage() async {
    await GetStorage.init();
  }
}
