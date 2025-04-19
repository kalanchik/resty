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
