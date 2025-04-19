import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:postmanovich/data/models/request/http_request_params.dart';
import 'package:postmanovich/domain/repository/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  RequestRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<Response?> sendRequest(HttpRequestParams params) async {
    log("TRY TO SEND REQUEST: ${params.toString()}");

    try {
      final response = await _dio.request(
        params.uri.origin + params.uri.path,
        data: params.body?.toRequest(),
        queryParameters: params.uri.queryParameters,
        options: Options(
          method: params.method.toCurl(),
          headers: params.headers,
        ),
      );

      log("RESPONSE: ${response.toString()}");

      return response;
    } on DioException catch (e) {
      log("REQUEST ERROR: ${e.response.toString()}");
      return e.response;
    }
  }
}
