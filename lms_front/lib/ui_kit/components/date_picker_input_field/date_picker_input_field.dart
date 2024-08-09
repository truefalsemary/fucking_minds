import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/extensions/date_picker_input_field.dart';
import 'package:lms_front/ui_kit/extensions/fonts.dart';

// TODO: find ranged date picker widget

class DatePickerInputField extends StatelessWidget {
  const DatePickerInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Даты курса',
              style: context.appTextTheme.header1,
            ),
            const SizedBox(width: 4),
            AppIcons.editPencil,
          ],
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            alignment: Alignment.centerLeft,
            minimumSize: const Size(491, 40),
            maximumSize: const Size(491, 80),
            side: BorderSide(
              color: context.datePickerInputFieldTheme.borderColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 18,
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Выберите дату',
                style: context.appTextTheme.code3Inline.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              AppIcons.calendar,
            ],
          ),
        ),
      ],
    );
  }
}
