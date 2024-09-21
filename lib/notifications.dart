import "package:flutter_local_notifications/flutter_local_notifications.dart";

class FlutterLocalNotification {
  FlutterLocalNotification._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
      const DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.max,
          showWhen: false,
        );

    const NotificationDetails notificationDetails =
        NotificationDetails(
          android: androidNotificationDetails,
          iOS: DarwinNotificationDetails(
            badgeNumber: 1
          )
        );

    await flutterLocalNotificationsPlugin.show(
        1, 'Title', 'body', notificationDetails);
  }
}


