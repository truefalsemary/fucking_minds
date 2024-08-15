import 'package:dio/dio.dart';
import 'package:lms_front/core/app_router/app_router_delegate.dart';
import 'package:lms_front/core/networking/api_client/api_client.dart';
import 'package:lms_front/core/networking/interceptors/auth_interceptor.dart';

class DiContainer {
  DiContainer();

  //Здесь лежат data провайдеры и общие классы, например ApiHttpClient

  late final ApiClient httpClient;
  late final AppRouterDelegate routerDelegate;

  void init() {
    //инициализация data providers и других классов

    const token = '';
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor(token));
    httpClient = ApiClient(dio);
    routerDelegate = AppRouterDelegate();
  }
}
