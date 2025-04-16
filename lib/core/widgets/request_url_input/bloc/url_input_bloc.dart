import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/curl/curl_request.dart';

part 'url_input_event.dart';
part 'url_input_state.dart';

class UrlInputBloc extends Bloc<UrlInputEvent, UrlInputState> {
  UrlInputBloc(this.input) : super(UrlInputInitial(input: input)) {
    on<ChangeUrlInputEvent>(_changed);
    on<CurlInsertUrlInputEvent>(_curlParsing);
  }

  Future<void> _changed(
    ChangeUrlInputEvent event,
    Emitter<UrlInputState> emit,
  ) async {
    input = event.value;
    if (Curl.isCurlRow(event.value)) {
      add(CurlInsertUrlInputEvent(event.value));

      return;
    }

    emit(UrlInputInitial(input: input));
  }

  Future<void> _curlParsing(
    CurlInsertUrlInputEvent event,
    Emitter<UrlInputState> emit,
  ) async {
    emit(UrlInputCurlParsing(input: event.curl));

    try {
      final curl = Curl.fromString(event.curl);

      emit(UrlInputCurl(input: input, curl: curl));
    } catch (e) {
      log("CURL PARSING ERROR: ${e.toString()}");
    }
  }

  String input;
}
