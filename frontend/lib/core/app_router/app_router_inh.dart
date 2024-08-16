import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends InheritedWidget {
  final GoRouter router;

  const AppRouter({
    required this.router,
    required super.child,
    super.key,
  });

  static AppRouter of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppRouter>();
    assert(result != null, 'No AppRouter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppRouter oldWidget) => router != oldWidget.router;

  void push(String route, [Object? extra]) {
    router.push(route, extra: extra);
  }

  void go(String route, [Object? extra]) {
    router.go(route, extra: extra);
  }

  void pop() {
    router.pop();
  }

  void goHome() {
    router.go('/');
  }

  /// Initially goes to 'program' tab
  void goToCoursePage(String courseId) {
    router.go('/course/$courseId/program');
  }

  void goToCoursePageSpecificTab(String courseId, String tabName) {
    router.go('/course/$courseId/$tabName');
  }

  void goToCourseSettings(String courseId) {
    router.go('/course/$courseId/settings');
  }
}

extension AppRouterExtension on BuildContext {
  AppRouter get appRouter => AppRouter.of(this);
}
