import 'package:lms_front/core/http_client.dart/api_http_client.dart';

class DiContainer {
  DiContainer();

  //Здесь лежат data провайдеры и общие классы, например ApiHttpClient
  
  final httpClient = const ApiHttpClient();


  void init() {
    //инициализация data providers
  }
}
