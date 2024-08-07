import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserRole {
  @JsonValue('student')
  student,

  @JsonValue('teacher')
  teacher,

  @JsonValue('admin')
  admin,
}


/// [User] with specific [UserRole]
/// which can be admin/teacher/student
/// 
/// Each role has its own permissions
@JsonSerializable()
class User {
  final String id;

  @JsonKey(name: 'full_name')
  final String fullname;

  final UserRole? role;

  User({
    required this.id,
    required this.fullname,
    this.role,
  });
}
