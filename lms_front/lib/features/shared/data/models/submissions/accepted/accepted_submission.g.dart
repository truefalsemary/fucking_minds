// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptedSubmission _$AcceptedSubmissionFromJson(Map<String, dynamic> json) =>
    AcceptedSubmission(
      taskId: json['id'] as String,
      contentLink: json['content_link'] as String,
      sentTs: DateTime.parse(json['sent_ts'] as String),
    );

Map<String, dynamic> _$AcceptedSubmissionToJson(AcceptedSubmission instance) =>
    <String, dynamic>{
      'id': instance.taskId,
      'content_link': instance.contentLink,
      'sent_ts': instance.sentTs.toIso8601String(),
    };
