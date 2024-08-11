import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String hint;

  final int? minLines;

  const TextInputField({
    required this.title,
    required this.hint,
    this.minLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.appTextTheme.header1,
            ),
            const SizedBox(width: 4),
            AppIcons.editPencil,
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            enabledBorder: context.textInputFieldTheme.border,
            border: context.textInputFieldTheme.border,
            hintText: hint,
            hintStyle: context.appTextTheme.code3Inline,
          ),
          minLines: minLines ?? context.textInputFieldTheme.minLines,
          maxLines: context.textInputFieldTheme.maxLines,
        ),
      ],
    );
  }
}
