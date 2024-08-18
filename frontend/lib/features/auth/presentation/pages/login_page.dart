import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/app_router.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/features/auth/domain/auth_cubit.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/features/auth/presentation/widgets/form_wrapper.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.login, super.key});

  final String login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FormWrapper(form: LoginForm(login: login)),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.login,
    super.key,
  });

  final String login;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  static const heightBetweenElements = 15.0;

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Log.info('login: ${widget.login}');

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
            TextField(
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(labelText: widget.login),
            ),
            const SizedBox(height: heightBetweenElements),
            TextField(
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
              onChanged: (value) {
                passwordController.text = value;

                // loginController.selection = TextSelection.fromPosition(
                //   TextPosition(offset: loginController.text.length),
                // );
              },
            ),
            const SizedBox(height: 1.5 * heightBetweenElements),
            AuthButton(
                inputText: 'Войти',
                onPressed: () => {
                      context
                          .read<AuthStore>()
                          .login(widget.login, passwordController.text),
                      context.appRouter.routerDelegate.beamToNamed('/'),
                    }),
          ],
        ));
  }
}
