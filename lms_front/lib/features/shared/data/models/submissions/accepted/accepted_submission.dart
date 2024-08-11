import 'package:json_annotation/json_annotation.dart';

part 'accepted_submission.g.dart';

@JsonSerializable(explicitToJson: true)
class AcceptedSubmission {
  @JsonKey(name: 'id')
  final String taskId;

  @JsonKey(name: 'content_link')
  final String contentLink;

  @JsonKey(name: 'sent_ts', fromJson: DateTime.parse)
  final DateTime sentTs;

  AcceptedSubmission({
    required this.taskId,
    required this.contentLink,
    required this.sentTs,
  });

  factory AcceptedSubmission.fromJson(Map<String, dynamic> json) =>
      _$AcceptedSubmissionFromJson(json);
  Map<String, dynamic> toJson() => _$AcceptedSubmissionToJson(this);
}
