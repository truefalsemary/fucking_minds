import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
import 'package:lms_front/core/utils/date_formatters.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/l10n/localization_extensions.dart';
import 'package:lms_front/ui_kit/components/card/decorated_container.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    required this.course,
    required this.leading,
    super.key,
  });

  final Course course;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.appRouter.go('/course/${course.id}/program'),
      child: DecoratedContainer(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading,
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 32),
                      ),
                      if (course.description.isNotEmpty)
                        Text(
                          course.description,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomRight,
              child: Builder(builder: (context) {
                final style = Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600);
                final startDate = course.startDate;
                final endDate = course.endDate;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (startDate != null)
                      Text(
                        'Начало: ${DateFormatters.courseDateToString(
                          startDate,
                          locale: context.currentLocale,
                        )}',
                        style: style,
                      ),
                    if (endDate != null)
                      Text(
                        'Конец: ${DateFormatters.courseDateToString(
                          endDate,
                          locale: context.currentLocale,
                        )}',
                        style: style,
                      ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
