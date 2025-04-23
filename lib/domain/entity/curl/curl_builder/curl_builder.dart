import 'dart:convert';

import 'package:postmanovich/domain/entity/curl/curl_request.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

abstract class CurlBuilder {
  const CurlBuilder();

  String toCurl(CurlHttpRequest curl);
}

class CurlDefaultBuilder implements CurlBuilder {
  const CurlDefaultBuilder();

  @override
  String toCurl(CurlHttpRequest curl) {
    final parts = <String>['curl'];

    // URL
    parts.add("'${curl.url}'");

    // Метод (если не GET)
    if (curl.method is! HttpMethodGet) {
      parts.add("-X ${curl.method.toCurl()}");
    }

    // Заголовки
    curl.headers.forEach((key, value) {
      parts.add("--header '$key: $value'");
    });

    // Тело запроса
    if (curl.body != null) {
      String bodyString;
      try {
        dynamic jsonData = jsonDecode(curl.body!.toJsonString());
        bodyString = const JsonEncoder.withIndent('    ').convert(jsonData);
      } catch (e) {
        bodyString = curl.body!.toJsonString();
      }
      bodyString = bodyString.replaceAll("'", "'\\''");
      parts.add("--data '$bodyString'");
    }

    return parts.join(' \\\n  ');
  }
}
