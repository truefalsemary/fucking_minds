// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      authorId: json['author_id'] as String,
      startDate: _fromJson(json['start_ts'] as String?),
      endDate: _fromJson(json['end_ts'] as String?),
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'author_id': instance.authorId,
      'start_ts': _toJson(instance.startDate),
      'end_ts': _toJson(instance.endDate),
    };
