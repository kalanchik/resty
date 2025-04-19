part of 'request_bloc.dart';

sealed class RequestState extends Equatable {
  const RequestState({
    required this.method,
  });

  final HttpMethod method;
}

final class RequestInitial extends RequestState {
  const RequestInitial({required super.method});

  @override
  List<Object?> get props => [super.method];
}

final class RequestLoading extends RequestState {
  const RequestLoading({required super.method});

  @override
  List<Object?> get props => [super.method];
}

final class RequestComplete extends RequestState {
  const RequestComplete({required super.method});

  @override
  List<Object?> get props => [super.method];
}
