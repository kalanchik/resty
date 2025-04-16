part of 'url_input_bloc.dart';

sealed class UrlInputState extends Equatable {
  const UrlInputState({required this.input});

  final String input;
}

final class UrlInputInitial extends UrlInputState {
  const UrlInputInitial({required super.input});

  @override
  List<Object?> get props => [super.input];
}

final class UrlInputCurl extends UrlInputState {
  const UrlInputCurl({
    required super.input,
    required this.curl,
  });

  final Curl curl;

  @override
  List<Object?> get props => [super.input, curl];
}

final class UrlInputCurlParsing extends UrlInputState {
  const UrlInputCurlParsing({required super.input});

  @override
  List<Object?> get props => [super.input];
}
