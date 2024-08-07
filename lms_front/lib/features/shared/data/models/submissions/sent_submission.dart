import 'package:json_annotation/json_annotation.dart';

part 'sent_submission.g.dart';

@JsonSerializable()
class SentSubmission {
  @JsonKey(name: 'content_link')
  final String contentLink;

  SentSubmission({
    required this.contentLink,
  });

  factory SentSubmission.fromJson(Map<String, dynamic> json) =>
      _$SentSubmissionFromJson(json);

  Map<String, dynamic> toJson() => _$SentSubmissionToJson(this);
}
