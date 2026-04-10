import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:movie/core/utils/app_notification.dart';
import 'package:movie/core/utils/notification_store.dart';

class FirebaseService {
  late final NotificationSettings notificationSettings;

  Future<void> initialize() async {
    notificationSettings = await FirebaseMessaging.instance.requestPermission(
      provisional: true,
    );

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Provisional permission granted");
    } else {
      print("Permission denied");
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $fcmToken");

    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      print("APNS Token: $apnsToken");
    }

    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessage);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleRemoteMessage(initialMessage);
    }
  }

  void _handleRemoteMessage(RemoteMessage message) {
    NotificationStore.instance.add(
      AppNotification.fromRemoteMessage(message),
    );
  }
}
