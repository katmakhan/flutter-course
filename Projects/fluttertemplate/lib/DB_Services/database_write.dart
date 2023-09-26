import 'package:fluttertemplate/DataModels/dm_gallery.dart';
import 'package:fluttertemplate/DataModels/dm_user.dart';
import 'package:fluttertemplate/Helpers/global_snackbar_get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class DatabaseWriteService {
  FirebaseDatabase db = FirebaseDatabase.instance;

  Future<bool> updateUserStatus(String key, String status, bool showit) async {
    // Sometimes the functions gets called with null or space string
    if (key == "null" || key == "") {
      GlobalSnackBarGet().showGetError("Error", "No user key found");
      return false;
    }
    // Initialise the main db here
    final ref = db.ref();

    try {
      // make sure to use await function for catching exception
      // Also catch value to response, for further processing if needed
      await ref.child("totalusers").child(key).child("st").set(status);

      if (showit) {
        GlobalSnackBarGet().showGetSucess("Sucess", "Details Updated.");
      }
    } on PlatformException catch (err) {
      GlobalSnackBarGet().showGetError("Error", err.toString());
      print("Catched error: $err");
      return false;
    } catch (e) {
      GlobalSnackBarGet().showGetError("Database Error", e.toString());
      print("Catched the database error:$e");
      return false;
    }

    // If reached till here, it was a success
    return true;
  }

  Future<bool> deleteFromRTD(String path, bool showit) async {
    //Showit, if you want to show the dialog or not
    //Initialise the main db ref here
    final ref = db.ref();

    print("Trying to delete path: $path");

    // Sometimes the functions gets called with null or space string
    if (path.isEmpty || path == "") {
      GlobalSnackBarGet().showGetError("Error in path", "Something went wrong");
      return false;
    }

    try {
      // make sure to use await function for catching exception
      await ref.child(path).remove();

      if (showit) {
        GlobalSnackBarGet().showGetSucess("Sucess", "Removed From RTD.");
      }
    } on PlatformException catch (err) {
      GlobalSnackBarGet().showGetError("Error", err.toString());
      print("Catched error: $err");
    } catch (e) {
      GlobalSnackBarGet().showGetError("Database Error", e.toString());
      print("Catched the database error:$e");
    }

    return true;
  }

  Future<bool> addToGallery(String category, Dm_Gallery gallery) async {
    //Showit, if you want to show the dialog or not
    //Initialise the main db ref here
    final ref = db.ref();

    // Sometimes the functions gets called with null or space string
    if (category.isEmpty || category == "") {
      return false;
    }

    try {
      // make sure to use await function for catching exception
      await ref.child("gallery").child(category).push().set(gallery.toJson());
      GlobalSnackBarGet()
          .showGetSucess("Sucess", "Added inside $category category");
    } on PlatformException catch (err) {
      GlobalSnackBarGet().showGetError("Error", err.toString());
      print("Catched error: $err");
    } catch (e) {
      GlobalSnackBarGet().showGetError("Database Error", e.toString());
      print("Catched the database error: $e");
    }

    return true;
  }

  Future<bool> addToUsers(Dm_User user, bool showit) async {
    //Showit, if you want to show the dialog or not
    //Initialise the main db ref here
    final ref = db.ref();

    try {
      // make sure to use await function for catching exception
      await ref.child("totalstudents").push().set(user.toJson());

      if (showit) {
        GlobalSnackBarGet().showGetSucess("Sucess", "Added user details");
      }
    } on PlatformException catch (err) {
      GlobalSnackBarGet().showGetError("Error", err.toString());
      print("Catched error: $err");
    } catch (e) {
      GlobalSnackBarGet().showGetError("Database Error", e.toString());
      print("Catched the database error: $e");
    }

    return true;
  }
}
