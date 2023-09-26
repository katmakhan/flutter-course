import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseReadService {
  FirebaseDatabase db = FirebaseDatabase.instance;

  //Get Course Category
  Future<List<Dm_User>?> getUsersList() async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('totalusers').get();

    List<Dm_User> userList = [];
    // List<String?> userNamelist = [];
    if (snapshot.exists) {
      print('users found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_User user = Dm_User();
        user = Dm_User.fromJson(value);

        // String name = user.name.toString();
        userList.add(user);
        // userNamelist.add(user.name.toString());
      });
    } else {
      print('No users found in template app');
    }
    return userList;
  }
}
