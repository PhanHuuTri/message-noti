import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin localNoti =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel hightChannel = AndroidNotificationChannel(
  'high_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);
Future<void> initializeLocalNotifications() async {
  //Firebase Initialization
  await Firebase.initializeApp();

  // iOS: Request permission & set foreground notification presentation options
  final fcm = FirebaseMessaging.instance;
  await fcm.requestPermission(alert: true, badge: true, sound: true);
  await fcm.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //Android: Create notification channel & permission for Android 13+
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosInit = DarwinInitializationSettings();
  const initSettings = InitializationSettings(
    android: androidInit,
    iOS: iosInit,
  );

  await localNoti.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (details) {
      // Handle notification tap
      print('Notification tapped with payload: ${details.payload}');
    },
  );

  await localNoti
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(hightChannel);

  //Handle foreground messages
  FirebaseMessaging.onMessage.listen(_onForegroundMessage);
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('App opened from notification: ${message.notification?.title}');
  });
}

void _onForegroundMessage(RemoteMessage message) async {
  final title =
      message.notification?.title ?? message.data['title'] ?? 'No Title';
  final body = message.notification?.body ?? message.data['body'] ?? 'No Body';

  await localNoti.show(
    message.hashCode,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        hightChannel.id,
        hightChannel.name,
        channelDescription: hightChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    ),
    payload: message.data['deeplink'] ?? 'No Payload',
  );
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Xử lý logic nhẹ (ghi log, prefetch…), đừng hiển thị local noti.
}
