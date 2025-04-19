import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_body.dart';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_http_body.dart';
import 'package:postmanovich/domain/entity/curl/curl_body_factory.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/domain/entity/request_method/request_method.dart';

part 'parse_curl.dart';

abstract class Curl extends Equatable {
  const Curl();

  String get url;

  CurlBody? get body;

  RequestMethod get method;

  String toCurl();

  factory Curl.fromString(String curl) => _parseCurlV2(curl);

  static bool isCurlRow(String row) {
    if (!row.startsWith('curl ')) {
      return false;
    }

    return true;
  }
}

class CurlHttpRequest extends Curl {
  const CurlHttpRequest({
    required String url,
    required HttpMethod method,
    required Map<String, String> headers,
    required dynamic body,
    required Map<String, String>? queryParameters,
  })  : _url = url,
        _method = method,
        _headers = headers,
        _body = body,
        _queryParameters = queryParameters;

  final String _url;
  final HttpMethod _method;
  final Map<String, String> _headers;
  final CurlBody? _body;
  final Map<String, String>? _queryParameters;

  @override
  String get url => _url;

  @override
  List<Object?> get props => [_url, _method, _headers, _body, _queryParameters];

  @override
  String toCurl() {
    final buffer = StringBuffer('curl');

    // Добавляем URL
    buffer.write(" '$_url'");

    // Добавляем метод (если не GET)
    if (_method is! HttpMethodGet) {
      buffer.write(' -X ${_method.toCurl()}');
    }

    // Добавляем заголовки
    _headers.forEach((key, value) {
      buffer.write(" -H '$key: $value'");
    });

    // Добавляем query параметры (если они не в URL)
    if (_queryParameters != null && _queryParameters.isNotEmpty) {
      final queryString = _queryParameters
          .map((key, value) => MapEntry(key, '$key=$value'))
          .values
          .join('&');
      if (_url.contains('?')) {
        buffer.write(" '$_url?$queryString'");
      }
    }

    // Добавляем тело запроса
    if (_body != null) {
      String bodyString;
      if (_body is Map || _body is List) {
        bodyString = jsonEncode(_body);
      } else {
        bodyString = _body.toString();
      }
      buffer.write(" --data-raw '$bodyString'");
    }

    return buffer.toString();
  }

  @override
  CurlBody? get body => _body;

  @override
  HttpMethod get method => _method;
}
