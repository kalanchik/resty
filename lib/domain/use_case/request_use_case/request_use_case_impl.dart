import 'package:postmanovich/core/typedef/typedefs.dart';
import 'package:postmanovich/data/models/request/http_request_body.dart';
import 'package:postmanovich/data/models/request/http_request_params.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/request/request_response_body.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/domain/entity/response/response_status_code.dart';
import 'package:postmanovich/domain/repository/request_repository.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';

class RequestUseCaseImpl implements RequestUseCase {
  RequestUseCaseImpl(this._repository);

  final RequestRepository _repository;

  @override
  Future<RequestResponse> sendRequest({
    required Uri uri,
    required Map<String, dynamic>? data,
    required HttpMethod method,
    required List<MapEntry<String, String>> headers,
  }) async {
    final Stopwatch stopwatch = Stopwatch();

    final headersMap = <String, String>{};

    headersMap.addEntries(headers);

    final params = HttpRequestParams(
      uri: uri,
      body: data != null ? HttpRequestBodyMap(data) : null,
      headers: headersMap,
      method: method,
    );

    stopwatch.start();

    final response = await _repository.sendRequest(params);

    stopwatch.stop();

    if (response == null) {
      return RequestHttpError(responseTime: stopwatch.elapsedMilliseconds);
    }

    RequestResponseBody? responseData;

    if (response.data is JSON) {
      responseData = RequestResponseJSONBody(response.data);
    }

    if (response.data is String) {
      responseData = RequestResponseStringBody(response.data);
    }

    return RequestHttpResponse(
      headers: response.headers.map.map(
        (key, value) => MapEntry(key, value.first),
      ),
      data: responseData,
      responseTime: stopwatch.elapsedMilliseconds,
      statusCode: response.statusCode != null
          ? ResponseStatusCode.fromHttp(response.statusCode!)
          : null,
    );
  }
}
