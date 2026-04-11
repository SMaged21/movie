import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_routes.dart';

class DeepLinks {
  DeepLinks() : _appLinks = AppLinks();

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;
  String? _lastHandledRoute;

  Future<String?> getInitialRoute() async {
    final initialUri = await _appLinks.getInitialLink();
    final route = _routeFromUri(initialUri);
    _lastHandledRoute = route;
    return route;
  }

  void startListening(GoRouter router) {
    _subscription?.cancel();
    _subscription = _appLinks.uriLinkStream.listen(
      (uri) {
        final route = _routeFromUri(uri);

        if (route == null || route == _lastHandledRoute) {
          return;
        }

        _lastHandledRoute = route;
        router.go(route);
      },
      onError: (Object error) {
        if (kDebugMode) {
          debugPrint("Deep link error: $error");
        }
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
  }

  String? _routeFromUri(Uri? uri) {
    if (uri == null) {
      return null;
    }

    final segments = [
      if (uri.host.isNotEmpty) uri.host,
      ...uri.pathSegments.where((segment) => segment.isNotEmpty),
    ];

    if (segments.length >= 2 && segments.first == "movie") {
      final movieId = int.tryParse(segments[1]);

      if (movieId != null) {
        return AppRoutes.movieDetailsPath(movieId);
      }
    }

    return null;
  }
}
