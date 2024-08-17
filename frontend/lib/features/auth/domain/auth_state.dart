import 'package:lms_front/features/auth/data/auth_repo.dart';

class AuthState {
  const AuthState({
     this.username,
     this.password,
     this.status = AuthenticationStatus.unauthenticated,
  });

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      username: map['username'] as String,
      password: map['password'] as String,
      status: map['status'] as AuthenticationStatus,
    );
  }

  static Map<String, dynamic> toMap(AuthState state) {
    return {
      'username': state.username,
      'password': state.password,
      'status': state.status.toString(),
    };
  }

  final String? username;
  final String? password;
  final AuthenticationStatus status;

  AuthState copyWith({
    String? username,
    String? password,
    AuthenticationStatus? status,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
