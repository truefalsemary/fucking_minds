import 'package:lms_front/core/http_client.dart/api_http_client.dart';

class DiContainer {
  DiContainer();

  //Здесь лежат data провайдеры и общие классы, например ApiHttpClient

  late final ApiHttpClient httpClient;

  void init() {
    //инициализация data providers
    httpClient = const ApiHttpClient();
  }
}
