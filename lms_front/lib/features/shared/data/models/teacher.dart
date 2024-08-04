import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Student {
  final String id;

  @JsonKey(name: 'full_name')
  final String fullname;

  Student({
    required this.id,
    required this.fullname,
  });
}
