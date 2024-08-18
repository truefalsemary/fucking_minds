import 'package:dio/dio.dart';
import 'package:lms_front/core/app_router/app_router_delegate.dart';
import 'package:lms_front/core/networking/api_client/api_client.dart';
import 'package:lms_front/core/networking/interceptors/auth_interceptor.dart';
import 'package:lms_front/features/auth/data/auth_repo.dart';

class DiContainer {
  DiContainer();

  //Здесь лежат data провайдеры и общие классы, например ApiHttpClient

  late final ApiClient httpClient;
  late final AppRouterDelegate routerDelegate;
  late final AuthenticationRepository authenticationRepository;

  void init() {
    //инициализация data providers и других классов

    const token = '71452484-9379-4534-baef-a8e4c5c4a7de';
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor(token));
    httpClient = ApiClient(dio);
    routerDelegate = AppRouterDelegate();
    authenticationRepository = AuthenticationRepository();
  }
}
