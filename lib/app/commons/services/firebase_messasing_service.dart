import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';
import 'package:weather/app/core/weather/presenter/view_models/weather_view_model.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Modular.tryGet<WeatherViewModel>() != null) {
    Modular.get<WeatherViewModel>().geocode();
  } else {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Handling a background message ${message.messageId}');
  }
}

class FirebaseMessasingService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.defaultImportance);
  final _localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    if (Modular.tryGet<WeatherViewModel>() != null) {
      Modular.get<WeatherViewModel>().setMessage(message);
    }
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  icon: '@drawable/ic_launcher')),
          payload: jsonEncode(message.toMap()));
      handleMessage(message);
    });
  }

  Future<void> initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotification.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      handleMessage(message);
    });

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<String?> getFcmToken() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    return token;
  }

  Future<void> initNotifications() async {
    initPushNotification();
    initLocalNotifications();
  }
}
