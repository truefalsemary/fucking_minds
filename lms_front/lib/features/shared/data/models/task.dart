import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

/// Task which should be completed by student [User]
/// any course can have many tasks
@JsonSerializable()
class Task {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String? contentLink;

  Task({
    required this.id,
    required this.title,
    required this.contentLink,
  });
}
