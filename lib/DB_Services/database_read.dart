import 'package:fluttertemplate/DataModels/dm_gallery.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseReadService {
  FirebaseDatabase db = FirebaseDatabase.instance;

  //Get Total users
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
        userList.add(user);

        // String name = user.name.toString();
        // userNamelist.add(user.name.toString());
      });
    } else {
      print('No users found in template app');
    }
    return userList;
  }

  // Get Total Gallery Categories
  Future<List<Dm_Gallery>?> getTotal_GalleryCatList() async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('gallerycat').get();

    List<Dm_Gallery> gallerycatList = [];
    if (snapshot.exists) {
      print('Total gallery categories found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_Gallery gallerycat = Dm_Gallery();
        gallerycat = Dm_Gallery.fromJson(value);
        gallerycatList.add(gallerycat);
      });
    } else {
      print('No total gallery  categoies found in template app');
    }
    return gallerycatList;
  }

  // Get Specific Gallery Categories
  Future<List<Dm_Gallery>?> getSpecific_GalleryCatList(String cat) async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('gallerycat').child(cat).get();

    List<Dm_Gallery> gallerycatList = [];
    if (snapshot.exists) {
      print('Specific gallery categories found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_Gallery gallerycat = Dm_Gallery();
        gallerycat = Dm_Gallery.fromJson(value);
        gallerycatList.add(gallerycat);
      });
    } else {
      print('No specific gallery categoies found in template app');
    }
    return gallerycatList;
  }
}
