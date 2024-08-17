import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class AppRouter extends InheritedWidget {
  final BeamerDelegate routerDelegate;

  const AppRouter({
    required this.routerDelegate,
    required super.child,
    super.key,
  });

  static AppRouter of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppRouter>();
    assert(result != null, 'No AppRouter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppRouter oldWidget) =>
      routerDelegate != oldWidget.routerDelegate;

  void push(String route, [Object? extra]) {
    routerDelegate.beamToNamed(route, data: extra);
  }

  void go(String route, [Object? extra]) {
    routerDelegate.beamToNamed(route, data: extra);
  }

  void pop() {
    routerDelegate.beamBack();
  }

  void goHome() {
    routerDelegate.beamToNamed('/');
  }

  /// Initially goes to 'program' tab
  void goToCoursePage(String courseId) {
    routerDelegate.beamToNamed('/course/$courseId/program');
  }

  void goToCoursePageSpecificTab(String courseId, String tabName) {
    routerDelegate.popToNamed('/course/$courseId/$tabName');
  }

  void goToCourseSettings(String courseId) {
    routerDelegate.popToNamed('/course/$courseId/settings');
  }
}

extension AppRouterExtension on BuildContext {
  AppRouter get appRouter => AppRouter.of(this);
}
