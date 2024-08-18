import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

// import 'package:lms_front/core/networking/api_client/api_client.dart';

enum AuthenticationStatus {
  @JsonValue('unknown')
  unknown,

  @JsonValue('authenticated')
  authenticated,

  @JsonValue('unauthenticated')
  unauthenticated,
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<void> logInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    // await ApiClient.instance.login(username, password);

    await Future.delayed(
      const Duration(milliseconds: 250),
      () => _controller.add(
          _areCredentialsValid(username: username, password: password)
              ? AuthenticationStatus.authenticated
              : AuthenticationStatus.unauthenticated),
    );
  }

  bool _areCredentialsValid({String? username, String? password}) =>
      username == 'user' && password == 'password';

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  void dispose() => _controller.close();
}
