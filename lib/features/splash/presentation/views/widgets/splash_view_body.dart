import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/assets/app_images.dart';
import 'package:movie/core/utils/app_routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<double> fadeAnimation;
  late AnimationController fadeController;

  @override
  void initState() {
    super.initState();

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeIn));

    fadeController.forward().whenComplete(() {
      if (mounted) {
        GoRouter.of(context).go(AppRoutes.moviesView);
      }
    });
  }

  @override
  void dispose() {
    fadeController.dispose(); // correct dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeTransition(
          opacity: fadeAnimation,
          child: Image.asset(AppImages.logo),
        ),
      ],
    );
  }
}
