import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/pages/first_auth_page.dart';
import 'package:lms_front/features/auth/presentation/pages/login_page.dart';
import 'package:lms_front/features/auth/presentation/pages/register_page.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/auth',
        '/auth/register',
        '/auth/login/:login',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final path = state.uri.pathSegments;

    if (path.contains('auth') && path.contains('login')) {
      final loginData = state.pathParameters['login'] ?? '';
      return [
        BeamPage(
          key: const ValueKey('Login'),
          title: 'Login',
          child: LoginPage(login: loginData),
        ),
      ];
    } else if (path.contains('auth') && path.contains('register')) {
      return [
        const BeamPage(
          key: ValueKey('Register'),
          title: 'Register',
          child: RegisterPage(),
        ),
      ];
    } else if (path.contains('auth')) {
      return [
        const BeamPage(
          key: ValueKey('FirstAuth'),
          title: 'Authentication',
          child: FirstAuthPage(),
        ),
      ];
    } else {
      return [];
    }
  }
}
