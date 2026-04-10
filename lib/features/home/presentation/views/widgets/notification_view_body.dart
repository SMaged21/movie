import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_notification.dart';
import 'package:movie/core/utils/notification_store.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<AppNotification>>(
      valueListenable: NotificationStore.instance.notifications,
      builder: (context, notifications, child) {
        if (notifications.isEmpty) {
          return const Center(
            child: Text(
              'No notifications yet',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final notification = notifications[index];

            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.notifications_active_outlined),
                title: Text(notification.title),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${notification.body}\n${_formatTimestamp(notification.receivedAt)}',
                  ),
                ),
                isThreeLine: true,
              ),
            );
          },
        );
      },
    );
  }

  String _formatTimestamp(DateTime dateTime) {
    final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    final normalizedHour = hour == 0 ? 12 : hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';

    return '${dateTime.day}/${dateTime.month}/${dateTime.year} $normalizedHour:$minute $period';
  }
}
