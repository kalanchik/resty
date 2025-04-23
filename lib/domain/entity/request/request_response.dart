import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/request/request_response_body.dart';
import 'package:postmanovich/domain/entity/response/response_status_code.dart';

sealed class RequestResponse extends Equatable {
  const RequestResponse();

  /// Время ответа в миллисекундах
  int get responseTime;

  /// Тело ответа
  RequestResponseBody? get data;

  /// Код ответа
  ResponseStatusCode? get statusCode;
}

class RequestHttpError extends RequestResponse {
  const RequestHttpError({required this.responseTime});

  @override
  RequestResponseBody? get data => null;

  @override
  final int responseTime;

  @override
  ResponseStatusCode? get statusCode => null;

  @override
  List<Object?> get props => [data, statusCode, responseTime];
}

class RequestHttpResponse extends RequestResponse {
  const RequestHttpResponse({
    required this.headers,
    required this.data,
    required this.responseTime,
    required this.statusCode,
  });

  final Map<String, String> headers;

  @override
  final RequestResponseBody? data;

  @override
  final int responseTime;

  @override
  final ResponseStatusCode? statusCode;

  @override
  List<Object?> get props => [
        responseTime,
        data,
        statusCode,
      ];
}
