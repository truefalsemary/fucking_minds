import 'package:lms_front/core/app_router/app_router_delegate.dart';
import 'package:lms_front/core/http_client.dart/api_http_client.dart';

class DiContainer {
  DiContainer();

  //Здесь лежат data провайдеры и общие классы, например ApiHttpClient

  late final ApiHttpClient httpClient;
  late final AppRouterDelegate routerDelegate;

  void init() {
    //инициализация data providers и других классов
    httpClient = const ApiHttpClient();
    routerDelegate = AppRouterDelegate();
  }
}
