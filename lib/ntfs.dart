import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Барање дозволи за нотификации
    NotificationSettings settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission for notifications');

      // Слушање на пораки додека апликацијата е во foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message received: ${message.notification?.title}');
        // Тука можете да прикажете локален попап за нотификација
      });

      // Слушање кога корисникот ќе отвори нотификација
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Notification clicked: ${message.notification?.title}');
      });
    } else {
      print('User declined or did not accept permission');
    }
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
