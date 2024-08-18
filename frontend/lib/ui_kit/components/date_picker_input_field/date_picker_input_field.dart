import 'package:flutter/material.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/core/utils/date_formatters.dart';
import 'package:lms_front/l10n/localization_extensions.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class DatePickerInputField extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  const DatePickerInputField({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  @override
  State<DatePickerInputField> createState() => _DatePickerInputFieldState();
}

class _DatePickerInputFieldState extends State<DatePickerInputField> {
  late DateTime? startCourseDate = widget.startDate;
  late DateTime? endCourseDate = widget.endDate;
  bool get _isDateSelected => startCourseDate != null && endCourseDate != null;

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
          onPressed: () => onChooseCourseDates(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isDateSelected
                    ? '${DateFormatters.courseDateToString(startCourseDate!, locale: context.currentLocale)} - ${DateFormatters.courseDateToString(endCourseDate!, locale: context.currentLocale)}'
                    : 'Даты курса',
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

  Future<void> onChooseCourseDates(BuildContext context) async {
    final currentDate = DateTime.now();

    final courseDateRange = await showDateRangePicker(
      context: context,
      locale: context.currentLocale,
      firstDate: DateTime.now(),
      lastDate: DateUtils.addMonthsToMonthDate(currentDate, 12 * 100),
    );

    if (courseDateRange == null) {
      return;
    }

    setState(() {
      startCourseDate = courseDateRange.start;
      endCourseDate = courseDateRange.end;
    });

    Log.info('Date range selected: $startCourseDate - $endCourseDate');
  }
}
