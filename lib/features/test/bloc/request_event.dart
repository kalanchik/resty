part of 'request_bloc.dart';

sealed class RequestEvent extends Equatable {
  const RequestEvent();
}

final class StartRequestEvent extends RequestEvent {
  @override
  List<Object?> get props => [];
}

final class ChangeMethodRequestEvent extends RequestEvent {
  const ChangeMethodRequestEvent({required this.method});

  final HttpMethod method;

  @override
  List<Object?> get props => [method];
}

final class ChangeDataRequestEvent extends RequestEvent {
  const ChangeDataRequestEvent({required this.data});

  final Map<String, dynamic>? data;

  @override
  List<Object?> get props => [data];
}

final class ChangeUrlRequestEvent extends RequestEvent {
  const ChangeUrlRequestEvent(this.url);

  final Uri? url;

  @override
  List<Object?> get props => [url];
}

final class ChangeHeadersRequestEvent extends RequestEvent {
  const ChangeHeadersRequestEvent(this.headers);

  final Map<String, String> headers;

  @override
  List<Object?> get props => [headers];
}

final class AddHeaderRequestEvent extends RequestEvent {
  const AddHeaderRequestEvent({required this.header});

  final MapEntry<String, String> header;

  @override
  List<Object?> get props => [header];
}

final class EditHeaderRequestEvent extends RequestEvent {
  const EditHeaderRequestEvent({required this.header, required this.index});

  final MapEntry<String, String> header;
  final int index;

  @override
  List<Object?> get props => [header, index];
}

final class AddParamRequestEvent extends RequestEvent {
  final MapEntry<String, String> param;

  const AddParamRequestEvent({required this.param});

  @override
  List<Object?> get props => [param];
}

final class EditParamRequestEvent extends RequestEvent {
  final MapEntry<String, String> param;
  final int index;

  const EditParamRequestEvent({required this.param, required this.index});

  @override
  List<Object?> get props => [param, index];
}

final class UpdateParamsRequestEvent extends RequestEvent {
  const UpdateParamsRequestEvent();

  @override
  List<Object?> get props => [];
}
