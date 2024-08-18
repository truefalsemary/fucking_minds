import 'package:flutter/material.dart';

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
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: form,
        ),
      ),
    );
  }
}
