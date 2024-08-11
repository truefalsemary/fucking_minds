import 'package:json_annotation/json_annotation.dart';
import 'package:lms_front/features/shared/data/models/user/user.dart';

part 'task.g.dart';

/// Task which should be completed by student [User]
/// any course can have many tasks
@JsonSerializable()
class Task {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String? contentLink;

  @JsonKey(name: 'author_id')
  final String authorId;

  Task({
    required this.id,
    required this.title,
    required this.contentLink,
    required this.authorId,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
