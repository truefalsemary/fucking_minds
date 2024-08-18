// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'author_id') required String authorId,
    @JsonKey(name: 'start_ts', fromJson: _fromJson, toJson: _toJson)
    DateTime? startDate,
    @JsonKey(name: 'end_ts', fromJson: _fromJson, toJson: _toJson)
    DateTime? endDate,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

DateTime? _fromJson(String? date) => date != null ? DateTime.parse(date) : null;

String? _toJson(DateTime? date) => date?.toIso8601String();
