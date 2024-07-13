import 'package:flutter/material.dart';
import 'package:flutter_sosmed/features/feeds/view/screens/feed_screen.dart';
import 'package:go_router/go_router.dart';

class RouteName {
  RouteName._();

  static const String initial = '/';
}

class AppRoute {
  static final router = GoRouter(
    initialLocation: RouteName.initial,
    routes: [
      GoRoute(
        path: RouteName.initial,
        pageBuilder: (context, state) => const MaterialPage(
          child: FeedScreen(),
        ),
      ),
    ],
  );
}
