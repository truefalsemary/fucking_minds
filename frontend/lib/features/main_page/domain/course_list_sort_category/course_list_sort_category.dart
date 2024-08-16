import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/core/utils/date_time_extension.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'course_list_sort_category.freezed.dart';

@freezed
class CourseListSortCategory with _$CourseListSortCategory {
  const factory CourseListSortCategory({
    required String displayName,
    required int tileColorInt,
    required int textColorInt,
    required List<Course> Function(List<Course>) fn,
  }) = _CourseListSortCategory;

  static List<CourseListSortCategory> get categories => [
        CourseListSortCategory(
          displayName: 'Все',
          tileColorInt: const Color(0xFF86C1F7).value,
          textColorInt: const Color(0xFF221D22).value,
          fn: (list) => list,
        ),
        CourseListSortCategory(
          displayName: 'Активные',
          tileColorInt: const Color(0xCCBD0935).value,
          textColorInt: const Color(0xFF221D22).value,
          fn: (list) => list.where(
            (e) {
              if (e.startDate == null || e.endDate == null) {
                return false;
              }
              final now = DateTime.now();
              return now.isAfterDate(e.startDate!) &&
                  now.isBeforeDate(e.endDate!);
            },
          ).toList(),
        ),
        CourseListSortCategory(
          displayName: 'Предстоящие',
          tileColorInt: const Color(0xFFFFD28D).value,
          textColorInt: const Color(0xFF221D22).value,
          fn: (list) => list.where(
            (e) {
              if (e.startDate == null || e.endDate == null) {
                return false;
              }
              final now = DateTime.now();
              return now.isBeforeDate(e.startDate!);
            },
          ).toList(),
        ),
        CourseListSortCategory(
          displayName: 'Завершенные',
          tileColorInt: const Color(0xFF98DCBA).value,
          textColorInt: const Color(0xFF221D22).value,
          fn: (list) => list.where(
            (e) {
              if (e.startDate == null || e.endDate == null) {
                return false;
              }
              final now = DateTime.now();
              return now.isAfterDate(e.endDate!);
            },
          ).toList(),
        ),
      ];
}
