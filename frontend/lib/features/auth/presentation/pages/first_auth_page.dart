import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/features/auth/presentation/widgets/form_wrapper.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class FirstAuthPage extends StatelessWidget {
  const FirstAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FormWrapper(form: _AuthForm()),
      ),
    );
  }
}

class _AuthForm extends StatefulWidget {
  const _AuthForm();

  @override
  State<_AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<_AuthForm> {
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
          const SizedBox(height: 1.5 * heightBetweenElements),
          AuthButton(
            inputText: 'Продолжить',
            onPressed: () => (),
            backgroundColor: ColorPalette.green,
          ),
          const SizedBox(height: heightBetweenElements),
          AuthButton(
            inputText: 'Зарегистрироваться',
            onPressed: () => (),
          ),
        ],
      ),
    );
  }
}
