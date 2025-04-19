import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestUseCase useCase;

  RequestBloc(this.useCase) : super(RequestInitial(method: HttpMethodGet())) {
    on<StartRequestEvent>((event, emit) async {
      if (state is RequestLoading) return;

      emit(RequestLoading(method: method));

      await useCase.sendRequest(
        uri: uri!,
        data: data,
        method: method,
      );

      emit(RequestComplete(method: method));
    });
    on<ChangeMethodRequestEvent>((event, emit) {
      method = event.method;

      emit(RequestInitial(method: method));
    });
    on<ChangeDataRequestEvent>((event, emit) {
      log("DATA: ${event.data.toString()}");
      data = event.data;
    });
    on<ChangeUrlRequestEvent>((event, emit) {
      log("URL: ${event.url.toString()}");
      uri = event.url;
    });
  }

  Uri? uri;
  Map<String, dynamic>? data;
  HttpMethod method = HttpMethodGet();
}
