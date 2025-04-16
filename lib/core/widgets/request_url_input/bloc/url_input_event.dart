part of 'url_input_bloc.dart';

sealed class UrlInputEvent extends Equatable {
  const UrlInputEvent();
}

final class ChangeUrlInputEvent extends UrlInputEvent {
  const ChangeUrlInputEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

final class CurlInsertUrlInputEvent extends UrlInputEvent {
  final String curl;

  const CurlInsertUrlInputEvent(this.curl);

  @override
  List<Object?> get props => [curl];
}
