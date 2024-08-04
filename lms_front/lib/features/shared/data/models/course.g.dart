// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String,
      title: json['title'] as String,
      startDate: DateTime.parse(json['start_ts'] as String),
      endDate: DateTime.parse(json['end_ts'] as String),
      description: json['description'] as String,
      authorId: json['authorId'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start_ts': instance.startDate?.toIso8601String(),
      'end_ts': instance.endDate?.toIso8601String(),
      'description': instance.description,
      'authorId': instance.authorId,
    };
