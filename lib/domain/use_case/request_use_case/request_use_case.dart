import 'package:postmanovich/domain/entity/request_method/http_method.dart';

abstract class RequestUseCase {
  Future<void> sendRequest({
    required Uri uri,
    required Map<String, dynamic>? data,
    required HttpMethod method,
  });
}
