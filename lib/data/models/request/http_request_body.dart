import 'package:equatable/equatable.dart';

abstract class HttpRequestBody extends Equatable {
  const HttpRequestBody();

  dynamic get data;

  dynamic toRequest();
}

class HttpRequestBodyMap extends HttpRequestBody {
  const HttpRequestBodyMap(this.data);

  @override
  final Map<String, dynamic> data;

  @override
  Map<String, dynamic> toRequest() => data;

  @override
  List<Object?> get props => [data];
}

class HttpRequestBodyRaw extends HttpRequestBody {
  const HttpRequestBodyRaw(this.data);

  @override
  final String data;

  @override
  String toRequest() => data;

  @override
  List<Object?> get props => [data];
}
