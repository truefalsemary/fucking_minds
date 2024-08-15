// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      id: json['id'] as String,
      title: json['title'] as String,
      contentLink: json['content_link'] as String?,
      authorId: json['author_id'] as String,
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content_link': instance.contentLink,
      'author_id': instance.authorId,
    };
