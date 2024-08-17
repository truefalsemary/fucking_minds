import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.inputText,
    super.key,
    this.onPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = ColorPalette.blue,
  });

  final String inputText;
  final Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(
        inputText,
        style: context.appTextTheme.body3,
      ),
    );
  }
}
