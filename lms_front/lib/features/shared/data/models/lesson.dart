import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

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
