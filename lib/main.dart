import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/Auth_Service/auth_service.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Helpers/get_database.dart';
import 'package:fluttertemplate/PushNotification/notifcation_service.dart';
import 'package:fluttertemplate/PushNotification/notifcation_service_firebase.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await NotificationService().initNotification();
  await NotificationServiceFirebase().initNotificationFirebase();
  await Get.put(Database()).initStorage();

  // FirebaseDatabase.instance.setPersistenceEnabled(true);
  // await FirebaseAppCheck.instance.activate(
  //     // androidProvider: AndroidProvider.playIntegrity,
  //     appleProvider: AppleProvider.appAttest);

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuthState(),
    );
  }
}
