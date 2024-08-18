import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/features/auth/data/auth_repo.dart';
import 'package:lms_front/features/auth/domain/auth_state.dart';

class AuthStore extends HydratedCubit<AuthState> {
  AuthStore() : super(const AuthState());

  final AuthenticationRepository _authRepo = AuthenticationRepository();

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  bool isAuthenticated() => state.status == AuthenticationStatus.authenticated;

  void logout() =>
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));

  Future<void> login(String username, String password) async {
    await _authRepo.logInWithEmailAndPassword(
      username: username,
      password: password,
    );
    emit(state.copyWith(status: AuthenticationStatus.authenticated));
    Log.info('status: ${state.status}');
    // print(state);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return AuthState.toMap(state);
  }
}
