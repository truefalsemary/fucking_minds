import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

/// Material of some specific [Course]
/// Can have [contentLink] for documents to download
@JsonSerializable()
class Material {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String? contentLink;

  @JsonKey(name: 'author_id')
  final String authorId;

  Material({
    required this.id,
    required this.title,
    required this.contentLink,
    required this.authorId,
  });
}
