import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/features/auth/presentation/widgets/form_wrapper.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FormWrapper(form: LoginForm()),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  static const heightBetweenElements = 15.0;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Вход',
              style: context.appTextTheme.header1,
            ),
            const SizedBox(height: heightBetweenElements),
            const TextField(
              decoration: InputDecoration(labelText: 'Логин'),
            ),
            const SizedBox(height: heightBetweenElements),
            const TextField(
              decoration: InputDecoration(labelText: 'Пароль'),
            ),
            const SizedBox(height: 1.5 * heightBetweenElements),
            AuthButton(inputText: 'Войти', onPressed: () => ()),
          ],
        ));
  }
}
