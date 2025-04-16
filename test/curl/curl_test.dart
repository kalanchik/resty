import 'package:flutter_test/flutter_test.dart';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_http_body.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

void main() {
  group('parseCurlV2', () {
    test('GET | NO BODY | NO HEADERS | NO PARAMS', () {
      final curlCommand =
          "curl --location 'https://crm.treasurepay.online/api/admin/payout/limit/all'";
      final expectedCurl = CurlHttpRequest(
        url: 'https://crm.treasurepay.online/api/admin/payout/limit/all',
        method: HttpMethodGet(),
        headers: {},
        body: null,
        queryParameters: {},
      );

      final actualCurl = Curl.fromString(curlCommand);

      expect(actualCurl, expectedCurl);
    });

    test('GET | NO BODY | NO HEADERS | WITH PARAMS', () {
      final curlCommand =
          "curl --location 'https://example.com?name=dima&age=15''";
      final expectedCurl = CurlHttpRequest(
        url: 'https://example.com?name=dima&age=15',
        method: HttpMethodGet(),
        headers: {},
        body: null,
        queryParameters: {
          "name": "dima",
          "age": "15",
        },
      );

      final actualCurl = Curl.fromString(curlCommand);

      expect(actualCurl, expectedCurl);
    });

    test('POST | WITH BODY | NO HEADERS', () {
      final curlCommand = """curl --location 'https://example.com' \
--data '{
    "from": "2025-01-17T9:30:12.369Z",
    "to": "2025-01-17T13:00:12.369Z",
    "internal_id": "",
    "type": "payout"
}'""";
      final expectedCurl = CurlHttpRequest(
        url: 'https://example.com',
        method: HttpMethodPost(),
        headers: {},
        body: CurlHttpBodyMap({
          "from": "2025-01-17T9:30:12.369Z",
          "to": "2025-01-17T13:00:12.369Z",
          "internal_id": "",
          "type": "payout"
        }),
        queryParameters: {},
      );

      final actualCurl = Curl.fromString(curlCommand);

      expect(actualCurl, expectedCurl);
    });

    test('POST | WITH BODY | WITH HEADERS', () {
      final curlCommand = """curl --location 'https://example.com' \
--header 'access: value' \
--header 'refresh: value' \
--data '{
    "from": "2025-01-17T9:30:12.369Z",
    "to": "2025-01-17T13:00:12.369Z",
    "internal_id": "",
    "type": "payout"
}'""";
      final expectedCurl = CurlHttpRequest(
        url: 'https://example.com',
        method: HttpMethodPost(),
        headers: {
          "access": "value",
          "refresh": "value",
        },
        body: CurlHttpBodyMap({
          "from": "2025-01-17T9:30:12.369Z",
          "to": "2025-01-17T13:00:12.369Z",
          "internal_id": "",
          "type": "payout"
        }),
        queryParameters: {},
      );

      final actualCurl = Curl.fromString(curlCommand);

      expect(actualCurl, expectedCurl);
    });

    test('BAD REQUEST', () {
      final curlCommand = 'curl -X POST -d "Hello, World!"';

      expect(() => Curl.fromString(curlCommand), throwsFormatException);
    });
  });
}
