import 'package:fluttertemplate/DataModels/dm_category.dart';
import 'package:fluttertemplate/DataModels/dm_gallery.dart';
import 'package:fluttertemplate/DataModels/dm_stock.dart';
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

  // Get categoires for dropdown
  Future<List<Dm_Category>?> getDropdown_CatList() async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('categories').get();

    List<Dm_Category> totalcatList = [];
    if (snapshot.exists) {
      print('Categories found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_Category category = Dm_Category();
        category = Dm_Category.fromJson(value);
        totalcatList.add(category);
      });
    } else {
      print('No categories found in template app');
    }
    return totalcatList;
  }

  // Get categoires for dropdown
  Future<List<Dm_Category>?> getEmptyList() async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('nothing').get();

    List<Dm_Category> totalcatList = [];
    if (snapshot.exists) {
      print('Categories found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_Category category = Dm_Category();
        category = Dm_Category.fromJson(value);
        totalcatList.add(category);
      });
    } else {
      print('No categories found in template app');
    }
    return totalcatList;
  }

  // Get sub categoires for dropdown
  Future<List<Dm_Category>?> getDropdown_SubCatList(String cat) async {
    final ref = db.ref();
    DataSnapshot snapshot = await ref.child('subcategories').child(cat).get();

    List<Dm_Category> totalcatList = [];
    if (snapshot.exists) {
      print('Sub categories found in the template app');

      var datalist = snapshot.value as Map<dynamic, dynamic>;

      datalist.forEach((key, value) {
        Dm_Category category = Dm_Category();
        category = Dm_Category.fromJson(value);
        totalcatList.add(category);
      });
    } else {
      print('No sub categories found in template app');
    }
    return totalcatList;
  }

  //Transactional Queries
  Future<void> transaction() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

    await ref.update({
      // Increment the age on the server
      "age": ServerValue.increment(1),
      // Add a server generated timestamp
      "createdAt": ServerValue.timestamp,
    });
  }

  // Realtime Listeners for Dictionary
  Stream<List<Dm_User>> getUsers(int limit) {
    return FirebaseDatabase.instance
        .ref("RealTime")
        .limitToFirst(limit) // To preserve the server load
        .onValue
        .map((event) => event.snapshot.children
            .map((e) => Dm_User.fromJson(e.value as Map<dynamic, dynamic>))
            .toList());
  }

  // Realtime Listeners for List
  Stream<List<dm_stock>> getStockdata(int limit) {
    return FirebaseDatabase.instance
        .ref("stockdata")
        .limitToFirst(limit) // To preserve the server load
        .onValue
        .map((event) => event.snapshot.children
            .map((e) => dm_stock
                .fromJson({"stckname": e.key.toString(), "ltp": e.value}))
            .toList());
  }
}
