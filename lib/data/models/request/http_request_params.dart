import 'package:equatable/equatable.dart';
import 'package:postmanovich/data/models/request/http_request_body.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

class HttpRequestParams extends Equatable {
  const HttpRequestParams({
    required this.uri,
    required this.body,
    required this.headers,
    required this.method,
  });

  final Uri uri;
  final HttpRequestBody? body;
  final Map<String, String>? headers;
  final HttpMethod method;

  @override
  List<Object?> get props => [
        uri,
        body,
        headers,
        method,
      ];
}
