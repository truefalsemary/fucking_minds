import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/utils/date_formatters.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_bloc.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_event.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_cubit.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_state.dart';
import 'package:lms_front/features/shared/presentation/page_view_horizontal_padding.dart';
import 'package:lms_front/l10n/localization_extensions.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

class CourseSettingsTab extends StatefulWidget {
  const CourseSettingsTab({super.key});

  @override
  State<CourseSettingsTab> createState() => _CourseSettingsTabState();
}

class _CourseSettingsTabState extends State<CourseSettingsTab> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  DateTime? _dateFrom;
  bool _dateFromEnabled = true;
  DateTime? _dateTo;
  bool _dateToEnabled = true;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingleCourseCubit, SingleCourseState>(
      listener: (context, state) {
        state.maybeWhen(
          loadSuccess: (course) {
            _titleController.text = course.title;
            _contentController.text = course.description;
            _dateFrom = course.startDate;
            _dateFromEnabled = _dateFrom != null;
            _dateTo = course.endDate;
            _dateToEnabled = _dateTo != null;
          },
          loadFailure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Initializing...')),
          loadInProgress: () =>
              const Center(child: CircularProgressIndicator()),
          loadSuccess: (course) => Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: PageViewHorizontalPadding(
                child: Column(
                  children: [
                    TextInputField(
                      title: 'Название',
                      hint: 'Название курса',
                      controller: _titleController,
                    ),
                    const SizedBox(height: 40),
                    TextInputField(
                      title: 'Описание',
                      hint: 'Описание курса',
                      controller: _contentController,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: SwitchableDatePickerTile(
                            title: 'Дата начала',
                            date: _dateFrom,
                            enabled: _dateFromEnabled,
                            onSaved: (newDateTime) =>
                                setState(() => _dateFrom = newDateTime),
                            onSwitched: ({required value}) => setState(
                              () => _dateFromEnabled = !_dateFromEnabled,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SwitchableDatePickerTile(
                            title: 'Дата окончания',
                            date: _dateTo,
                            enabled: _dateToEnabled,
                            onSaved: (newDateTime) =>
                                setState(() => _dateTo = newDateTime),
                            onSwitched: ({required value}) => setState(
                              () => _dateToEnabled = !_dateToEnabled,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    AuthButton(
                      inputText: 'Сохранить',
                      onPressed: () {
                        setState(() {
                          if (!_dateFromEnabled) {
                            _dateFrom = null;
                          }
                          if (!_dateToEnabled) {
                            _dateTo = null;
                          }
                        });
                        final courseState =
                            context.read<SingleCourseCubit>().state;
                        late final Course newCourse;
                        courseState.maybeWhen(
                          loadSuccess: (course) {
                            newCourse = course.copyWith(
                              title: _titleController.text,
                              description: _contentController.text,
                              startDate: _dateFrom,
                              endDate: _dateTo,
                            );
                          },
                          orElse: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to update course.')),
                            );
                          },
                        );
                        context
                            .read<CourseListBloc>()
                            .add(CourseListEvent.update(newCourse));
                        context.read<SingleCourseCubit>().set(newCourse);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          loadFailure: (message) => Center(child: Text('Error: $message')),
        );
      },
    );
  }
}

class SwitchableDatePickerTile extends StatelessWidget {
  final String title;
  final DateTime? date;
  final bool enabled;
  final Function(DateTime newDateTime) onSaved;
  final Function({required bool value}) onSwitched;

  const SwitchableDatePickerTile({
    required this.title,
    required this.date,
    required this.enabled,
    required this.onSaved,
    required this.onSwitched,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: context.appTextTheme.header1,
                ),
                const SizedBox(width: 4),
                AppIcons.editPencil,
                const SizedBox(width: 16),
              ],
            ),
            CupertinoSwitch(
              value: enabled,
              onChanged: (value) => onSwitched(value: value),
            ),
          ],
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            alignment: Alignment.centerLeft,
            side: BorderSide(
              color: enabled
                  ? context.datePickerInputFieldTheme.borderColor
                  : Colors.grey,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 18,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date == null
                    ? 'Выбрать дату...'
                    : DateFormatters.courseDateToString(
                        date!,
                        locale: context.currentLocale,
                      ),
                style: context.appTextTheme.code3Inline.copyWith(
                  color: enabled
                      ? Theme.of(context).hintColor
                      : Colors.grey.shade400,
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
