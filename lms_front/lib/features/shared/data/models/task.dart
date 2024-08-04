import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String contentLink;

  Task({
    required this.id,
    required this.title,
    required this.contentLink,
  });
}
