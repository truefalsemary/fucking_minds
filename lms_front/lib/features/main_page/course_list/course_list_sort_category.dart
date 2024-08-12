import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/core/utils/date_time_extension.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

class CourseListSortCategory extends Equatable {
  final String displayName;
  final int tileColorInt;
  final int textColorInt;
  final List<Course> Function(List<Course>) fn;

  const CourseListSortCategory({
    required this.displayName,
    required this.tileColorInt,
    required this.textColorInt,
    required this.fn,
  });

  @override
  List<Object?> get props => [displayName, tileColorInt, textColorInt];

  static final List<CourseListSortCategory> categories = [
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
          return now.isAfterDate(e.startDate!) && now.isBeforeDate(e.endDate!);
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
