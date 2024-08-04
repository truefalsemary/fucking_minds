// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      id: json['id'] as String,
      title: json['title'] as String,
      contentLink: json['content_link'] as String,
      authorId: json['author_id'] as String,
    );

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content_link': instance.contentLink,
      'author_id': instance.authorId,
    };
