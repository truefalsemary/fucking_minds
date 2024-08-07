import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

/// Lesson which can be created by [User]
/// [authorId] is id of [User] who created this lesson
///
/// Course should have [title] and [description]
///
/// Also course have its [Material]s and [Task]s
/// Which can be added by [User]s with specific role
@JsonSerializable()
class Lesson {
  final String id;
  final String title;
  final String description;

  @JsonKey(name: 'author_id')
  final String authorId;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.authorId,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
