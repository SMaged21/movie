import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: NotificationViewBody());
  }
}
