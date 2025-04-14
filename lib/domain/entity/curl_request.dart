class CurlRequest {
  CurlRequest({
    required this.url,
    required this.method,
    required this.headers,
    this.body,
    this.queryParameters,
  });

  final String url;
  final String method;
  final Map<String, String> headers;
  final dynamic body;
  final Map<String, String>? queryParameters;
}
