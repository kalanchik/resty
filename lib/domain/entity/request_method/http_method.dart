import 'package:postmanovich/config/constants/globals.dart';
import 'package:postmanovich/domain/entity/request_method/request_method.dart';

sealed class HttpMethod extends RequestMethod {
  const HttpMethod();

  factory HttpMethod.fromString(String value) {
    return switch (value) {
      Globals.httpMethodGet => const HttpMethodGet(),
      Globals.httpMethodPost => const HttpMethodPost(),
      _ => throw Exception("Unknown http method: $value"),
    };
  }
}

class HttpMethodGet extends HttpMethod {
  const HttpMethodGet();

  @override
  String toCurl() {
    return "GET";
  }

  @override
  List<Object?> get props => ["GET"];
}

class HttpMethodPost extends HttpMethod {
  const HttpMethodPost();

  @override
  String toCurl() {
    return "POST";
  }

  @override
  List<Object?> get props => ["POST"];
}
