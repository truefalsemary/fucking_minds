import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('student')
  student,

  @JsonValue('teacher')
  teacher,

  @JsonValue('admin')
  admin,
}
