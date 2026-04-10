import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/assets/app_images.dart';
import 'package:movie/core/utils/app_routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.logo, width: 100, height: 100),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.notifictionView);
          },
          icon: Icon(Icons.notifications),
        ),
      ],
    );
  }
}
