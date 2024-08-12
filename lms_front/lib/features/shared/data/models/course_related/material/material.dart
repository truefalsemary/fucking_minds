import 'package:json_annotation/json_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'material.g.dart';

/// Material of some specific [Course]
/// Can have [contentLink] for documents to download
@JsonSerializable()
class Resource {
  final String id;
  final String title;

  @JsonKey(name: 'content_link')
  final String? contentLink;

  @JsonKey(name: 'author_id')
  final String authorId;

  Resource({
    required this.id,
    required this.title,
    required this.contentLink,
    required this.authorId,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
