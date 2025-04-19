import 'dart:developer';

import 'package:postmanovich/data/models/request/http_request_body.dart';
import 'package:postmanovich/data/models/request/http_request_params.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/domain/repository/request_repository.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';

class RequestUseCaseImpl implements RequestUseCase {
  RequestUseCaseImpl(this._repository);

  final RequestRepository _repository;

  @override
  Future<void> sendRequest({
    required Uri uri,
    required Map<String, dynamic>? data,
    required HttpMethod method,
  }) async {
    final params = HttpRequestParams(
      uri: uri,
      body: data != null ? HttpRequestBodyMap(data) : null,
      headers: null,
      method: method,
    );

    final response = await _repository.sendRequest(params);

    log(response.toString());
  }
}
