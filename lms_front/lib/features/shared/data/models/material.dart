import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class Material {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String contentLink;

  @JsonKey(name: 'author_id')
  final String authorId;

  Material({
    required this.id,
    required this.title,
    required this.contentLink,
    required this.authorId,
  });
}
