import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/PushNotification/notifcation_service.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// This should be a top class, background message, outside the init
Future<void> handleMessageBackground(RemoteMessage? message) async {
  if (message == null) return;

  //Moving to the activity where the notification recieved
  //Moving to news/updates/pages

  print("Recieved the message on background");

  navigatorKey.currentState!.pushNamed("/message", arguments: message);

  // final data = ModalRoute.of(context)!.settings.arguments; to get the arguments inside page
}

class NotificationServiceFirebase {
  final firebasemessaging = FirebaseMessaging.instance;

  Future<void> initNotificationFirebase() async {
    await firebasemessaging.requestPermission();
    final FCM_Token = await firebasemessaging.getToken();
    print("fcm token is $FCM_Token");

    //For Topic Subscription
    await FirebaseMessaging.instance.subscribeToTopic("updates");

    // For IOS Settings
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    // Clicking on Notification
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((msg) => handleMessage(msg));

    // When app is open
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      handleMessage(msg);

      // To show local notification
      FirebaseMessaging.onMessage.listen((event) {
        //Call the local notification
        NotificationService().showNotificationBasic(
            id: 0,
            title: "Local",
            body: "test local body",
            payLoad: jsonEncode(msg.toMap()));
      });
    });

    // From background, after closing app
    FirebaseMessaging.onBackgroundMessage(
        (message) => handleMessageBackground(message));
  }

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;

    //Moving to the activity where the notification recieved
    //Moving to news/updates/pages

    print("Recieved the message");
    // print(message.)

    navigatorKey.currentState!.pushNamed("/message", arguments: message);

    // final data = ModalRoute.of(context)!.settings.arguments; to get the arguments inside page
  }
}
