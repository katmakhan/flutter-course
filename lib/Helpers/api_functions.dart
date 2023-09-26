// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:fluttertemplate/Helpers/app_string.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<String?> fetchLogin(String email, String password) async {
    var response = await client.get(Uri.parse(
        "${Appstring.apibaseurl}requestType=1001&uname=$email&pass=$password"));
    if (response.statusCode == 200 &&
        json.decode(response.body)['msg'] == "Logged in successfully!") {
      var jsonresult = json.decode(response.body);
      var data = jsonresult["data"];
      // var msg = jsonresult["msg"];

      // Get.snackbar(
      //   "Sucess",
      //   "Logged In",
      //   snackPosition: SnackPosition.BOTTOM,
      //   icon: Icon(Icons.person, color: Colors.white),
      //   backgroundColor: Colors.green,
      //   borderRadius: 20,
      //   margin: EdgeInsets.fromLTRB(15, 15, 15, 100),
      //   duration: Duration(seconds: 1),
      //   isDismissible: true,
      //   dismissDirection: DismissDirection.horizontal,
      //   forwardAnimationCurve: Curves.easeOutBack,
      // );

      return data;
    } else {
      //show error message
      // Get.snackbar(
      //   "Error",
      //   json.decode(response.body)['msg'],
      //   snackPosition: SnackPosition.BOTTOM,
      //   icon: Icon(Icons.person, color: Colors.white),
      //   backgroundColor: Colors.red,
      //   borderRadius: 20,
      //   margin: EdgeInsets.fromLTRB(15, 15, 15, 100),
      //   colorText: Colors.black,
      //   duration: Duration(seconds: 1),
      //   isDismissible: true,
      //   dismissDirection: DismissDirection.horizontal,
      //   forwardAnimationCurve: Curves.easeOutBack,
      // );
      return null;
    }
  }
}
