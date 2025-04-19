import 'package:dio/dio.dart';
import 'package:postmanovich/data/models/request/http_request_params.dart';

abstract class RequestRepository {
  Future<Response?> sendRequest(HttpRequestParams params);
}
