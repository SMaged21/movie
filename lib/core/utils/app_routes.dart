import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/home/presentation/views/movie_details_view.dart';
import 'package:movie/features/home/presentation/views/movies_view.dart';
import 'package:movie/features/home/presentation/views/notification_view.dart';
import 'package:movie/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static String moviesView = "/moviesView";
  static String moviesDetailsView = "/moviesDetailsView";
  static String notifictionView = "/notifictionView";
  static String? _lastLoggedUri;
  static GoRouter route = GoRouter(
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final uri = state.uri.toString();

      if (kDebugMode && uri != "/" && uri != _lastLoggedUri) {
        debugPrint("Deep link opened: $uri");
        _lastLoggedUri = uri;
      }

      return null;
    },
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashView()),
      GoRoute(path: moviesView, builder: (context, state) => MoviesView()),
      GoRoute(
        path: moviesDetailsView,
        builder: (context, state) => MovieDetailsView(),
      ),
      GoRoute(
        path: notifictionView,
        builder: (context, state) => NotificationView(),
      ),
    ],
  );
}
