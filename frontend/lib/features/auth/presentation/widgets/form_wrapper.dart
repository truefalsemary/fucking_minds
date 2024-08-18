import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_shadows.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    required this.form,
    super.key,
  });

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [AppShadows.card],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: form,
        ),
      ),
    );
  }
}
