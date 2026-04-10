import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotification {
  const AppNotification({
    required this.title,
    required this.body,
    required this.receivedAt,
  });

  final String title;
  final String body;
  final DateTime receivedAt;

  factory AppNotification.fromRemoteMessage(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;

    return AppNotification(
      title:
          notification?.title ?? data['title']?.toString() ?? 'New notification',
      body: notification?.body ?? data['body']?.toString() ?? 'No details',
      receivedAt: DateTime.now(),
    );
  }
}
