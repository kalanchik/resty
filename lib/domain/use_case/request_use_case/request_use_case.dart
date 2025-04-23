import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

abstract class RequestUseCase {
  Future<RequestResponse> sendRequest({
    required Uri uri,
    required Map<String, dynamic>? data,
    required HttpMethod method,
    required List<MapEntry<String, String>> headers,
  });
}
