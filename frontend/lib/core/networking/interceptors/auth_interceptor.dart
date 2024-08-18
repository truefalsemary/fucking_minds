import 'package:dio/dio.dart';

const authHeader = 'X-Ya-User-Ticket';

class AuthInterceptor extends Interceptor {
  final String token;

  AuthInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[authHeader] = token;
    return super.onRequest(options, handler);
  }
}
