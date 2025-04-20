part of 'request_bloc.dart';

sealed class RequestState extends Equatable {
  const RequestState({
    required this.method,
    required this.headersEnties,
    required this.paramsEntries,
  });

  final HttpMethod method;
  final List<MapEntry<String, String>> headersEnties;
  final List<MapEntry<String, String>> paramsEntries;
}

final class RequestInitial extends RequestState {
  const RequestInitial({
    required super.method,
    required super.headersEnties,
    required super.paramsEntries,
  });

  @override
  List<Object?> get props => [
        super.method,
        super.headersEnties,
        super.paramsEntries,
      ];
}

final class RequestLoading extends RequestState {
  const RequestLoading({
    required super.method,
    required super.headersEnties,
    required super.paramsEntries,
  });

  @override
  List<Object?> get props => [
        super.method,
        super.headersEnties,
        super.paramsEntries,
      ];
}

final class RequestComplete extends RequestState {
  const RequestComplete({
    required super.method,
    required super.headersEnties,
    required super.paramsEntries,
  });

  @override
  List<Object?> get props => [
        super.method,
        super.headersEnties,
        super.paramsEntries,
      ];
}

final class RequestChangeUrl extends RequestState {
  const RequestChangeUrl({
    required super.method,
    required super.headersEnties,
    required super.paramsEntries,
    required this.newUrl,
  });

  final String newUrl;

  @override
  List<Object?> get props => [
        newUrl,
        super.method,
        super.headersEnties,
        super.paramsEntries,
      ];
}
