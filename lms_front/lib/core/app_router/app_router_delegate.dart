import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouterDelegate {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Container(),
      ),
    ],
  );
}
