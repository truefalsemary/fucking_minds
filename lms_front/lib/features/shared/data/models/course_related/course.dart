import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String id;
  final String title;

  /// Optional start date of the course
  @JsonKey(name: 'start_ts', fromJson: DateTime.parse)
  final DateTime? startDate;

  /// Optional end date of the course
  @JsonKey(name: 'end_ts', fromJson: DateTime.parse)
  final DateTime? endDate;

  final String description;

  @JsonKey(name: 'author_id')
  final String authorId;

  Course({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.authorId,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
