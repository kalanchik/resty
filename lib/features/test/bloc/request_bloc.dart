import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_http_body.dart';
import 'package:postmanovich/domain/entity/curl/curl_builder/curl_builder.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestUseCase useCase;
  final Talker logger;

  RequestBloc(this.useCase, this.logger)
      : super(const RequestInitial(
          method: HttpMethodGet(),
          headersEnties: [],
          paramsEntries: [],
        )) {
    on<StartRequestEvent>((event, emit) async {
      if (state is RequestLoading) return;

      emit(RequestLoading(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));

      final response = await useCase.sendRequest(
        uri: uri!,
        data: data,
        method: method,
        headers: headersEntries,
      );

      emit(RequestComplete(
        response: response,
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<ChangeMethodRequestEvent>((event, emit) {
      method = event.method;

      emit(RequestInitial(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<ChangeDataRequestEvent>((event, emit) {
      log("DATA: ${event.data.toString()}");
      data = event.data;
    });
    on<ChangeUrlRequestEvent>((event, emit) {
      log("URL: ${event.url.toString()}");
      uri = event.url;

      paramsEntries = uri?.queryParameters.entries.toList() ?? [];

      emit(RequestInitial(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<ChangeHeadersRequestEvent>((event, emit) {
      log("HEADERS: ${event.headers.toString()}");
      headersEntries = event.headers.entries.toList();

      emit(RequestInitial(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<AddHeaderRequestEvent>((event, emit) {
      final newHeaders = List<MapEntry<String, String>>.from(headersEntries);

      newHeaders.add(event.header);

      headersEntries = newHeaders;

      emit(RequestInitial(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<EditHeaderRequestEvent>((event, emit) {
      if (headersEntries.elementAtOrNull(event.index) == null) {
        headersEntries.add(event.header);
        emit(RequestInitial(
          method: method,
          headersEnties: headersEntries,
          paramsEntries: paramsEntries,
        ));
        return;
      }

      headersEntries[event.index] = event.header;

      emit(RequestInitial(
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });

    on<AddParamRequestEvent>((event, emit) {
      final newParams = List<MapEntry<String, String>>.from(paramsEntries);

      newParams.add(event.param);

      paramsEntries = newParams;

      add(const UpdateParamsRequestEvent());
    });

    on<EditParamRequestEvent>((event, emit) {
      if (paramsEntries.elementAtOrNull(event.index) == null) {
        paramsEntries.add(event.param);
        emit(RequestInitial(
          method: method,
          headersEnties: headersEntries,
          paramsEntries: paramsEntries,
        ));
        return;
      }

      paramsEntries[event.index] = event.param;

      add(const UpdateParamsRequestEvent());
    });
    on<UpdateParamsRequestEvent>((event, emit) {
      final paramsMap = <String, String>{};

      paramsMap.addEntries(paramsEntries);

      uri = uri?.replace(queryParameters: paramsMap);

      final String newUrl = uri == null ? "" : uri!.toString();

      emit(RequestChangeUrl(
        newUrl: newUrl,
        method: method,
        headersEnties: headersEntries,
        paramsEntries: paramsEntries,
      ));
    });
    on<ExportRequestEvent>((event, emit) {
      try {
        if (uri == null) {
          emit(RequestExportError(
            method: method,
            headersEnties: headersEntries,
            paramsEntries: paramsEntries,
            error: "URL not found",
          ));
          return;
        }

        CurlHttpBody? body;

        if (data != null) {
          body = CurlHttpBodyMap(data!);
        }

        final CurlHttpRequest curl = CurlHttpRequest(
          url: uri.toString(),
          method: method,
          headers: headers,
          body: body,
          queryParameters: null,
        );

        final String curlString = curlBuilder.toCurl(curl);

        emit(RequestExportSuccess(
          curlString: curlString,
          method: method,
          headersEnties: headersEntries,
          paramsEntries: paramsEntries,
        ));
      } catch (e) {
        emit(RequestExportError(
          method: method,
          headersEnties: headersEntries,
          paramsEntries: paramsEntries,
          error: e.toString(),
        ));
      }
    });
  }

  Map<String, String> get headers {
    final result = <String, String>{};

    result.addEntries(headersEntries);

    return result;
  }

  static const CurlBuilder curlBuilder = CurlDefaultBuilder();
  Uri? uri;
  Map<String, dynamic>? data;
  List<MapEntry<String, String>> headersEntries = [];
  List<MapEntry<String, String>> paramsEntries = [];
  HttpMethod method = const HttpMethodGet();
}
