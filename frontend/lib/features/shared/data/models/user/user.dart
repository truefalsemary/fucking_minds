import 'package:json_annotation/json_annotation.dart';

import 'package:lms_front/features/shared/data/models/user/user_role.dart';

part 'user.g.dart';

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
