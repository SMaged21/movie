import 'package:flutter/foundation.dart';
import 'package:movie/core/utils/app_notification.dart';

class NotificationStore {
  NotificationStore._();

  static final NotificationStore instance = NotificationStore._();

  final ValueNotifier<List<AppNotification>> notifications = ValueNotifier([]);

  void add(AppNotification notification) {
    notifications.value = [notification, ...notifications.value];
  }
}
