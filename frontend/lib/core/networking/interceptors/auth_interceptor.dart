import 'package:dio/dio.dart';

const authHeader = 'X-Ya-User-Ticket';

class AuthInterceptor extends Interceptor {
  final String token;

  AuthInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[authHeader] = '71452484-9379-4534-baef-a8e4c5c4a7de';
    return super.onRequest(options, handler);
  }

}
