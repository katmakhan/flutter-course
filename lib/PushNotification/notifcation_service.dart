import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

// channelName is a human-readable name or title for the notification channel.
// channelID is a unique identifier for each notification channel in your app.

  notificationDetailsBasic() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'basic_notification', 'Notifications',
            channelDescription: "To show notification from app",
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  notificationDetailsOrders() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'order_notification', 'Order Notifications',
            channelDescription: "To show notification for orders",
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotificationBasic(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetailsBasic());
  }

  Future showNotificationOrders(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetailsBasic());
  }
}
