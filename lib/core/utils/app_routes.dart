import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/home/presentation/views/movie_details_view.dart';
import 'package:movie/features/home/presentation/views/movies_view.dart';
import 'package:movie/features/home/presentation/views/notification_view.dart';
import 'package:movie/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String moviesView = "/moviesView";
  static const String moviesDetailsView = "/movie/:id";
  static const String notifictionView = "/notifictionView";
  static const String _movieBasePath = "/movie";
  static String? _lastLoggedUri;

  static String movieDetailsPath(int id) => "$_movieBasePath/$id";

  static GoRouter createRouter({String? initialLocation}) {
    return GoRouter(
      initialLocation: initialLocation ?? "/",
      // We normalize deep links ourselves through `DeepLinks`, so GoRouter
      // should not also try to treat the raw platform URI as an app route.
      overridePlatformDefaultLocation: true,
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
        GoRoute(path: "/", builder: (context, state) => const SplashView()),
        GoRoute(
          path: moviesView,
          builder: (context, state) => const MoviesView(),
        ),
        GoRoute(
          path: moviesDetailsView,
          builder: (context, state) {
            final movieId = int.tryParse(state.pathParameters["id"] ?? "");

            if (movieId == null) {
              return const Scaffold(
                body: Center(child: Text("Invalid movie link")),
              );
            }

            return MovieDetailsView(movieId: movieId);
          },
        ),
        GoRoute(
          path: notifictionView,
          builder: (context, state) => const NotificationView(),
        ),
      ],
    );
  }
}
