import 'dart:convert';

import 'package:postmanovich/domain/entity/curl/curl_body/curl_body.dart';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_http_body.dart';

class CurlBodyFactory {
  CurlBodyFactory._();

  static CurlBody create({
    required String rawData,
    required bool isBinary,
  }) {
    if (isBinary) {
      return CurlHttpBodyString(rawData);
    }

    try {
      final parsed = jsonDecode(rawData);

      if (parsed is List) return CurlHttpBodyList(parsed);

      if (parsed is Map<String, dynamic>) return CurlHttpBodyMap(parsed);
    } catch (_) {}

    return CurlHttpBodyString(rawData);
  }
}
