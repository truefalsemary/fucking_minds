import 'package:flutter/material.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/core/utils/date_formatters.dart';
import 'package:lms_front/l10n/localization_extensions.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class DatePickerInputField extends StatelessWidget {
  const DatePickerInputField({
    super.key,
    this.title = 'Даты курса',
    this.titleStyle,
  });

  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DatePickerHeader(
          titleWidget: Text(
            'Даты курса',
            style: titleStyle ?? context.appTextTheme.header1,
          ),
        ),
        const SizedBox(height: 20),
        const _DatePickerButton(),
      ],
    );
  }
}

class _DatePickerHeader extends StatelessWidget {
  const _DatePickerHeader({required this.titleWidget});

  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        titleWidget,
        const SizedBox(width: 4),
        AppIcons.editPencil,
      ],
    );
  }
}

class _DatePickerButton extends StatefulWidget {
  const _DatePickerButton();

  @override
  State<_DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<_DatePickerButton> {
  DateTime? startCourseDate;
  DateTime? endCourseDate;

  bool get _isDateSelected => startCourseDate != null && endCourseDate != null;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
