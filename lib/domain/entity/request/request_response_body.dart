import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:postmanovich/core/typedef/typedefs.dart';
import 'package:postmanovich/domain/entity/json/json_text_formatter/json_text_formatter.dart';

sealed class RequestResponseBody extends Equatable {
  const RequestResponseBody();

  dynamic get data;

  String toRaw();

  JSON toJson();

  dynamic toHTMLView();
}

class RequestResponseJSONBody extends RequestResponseBody {
  const RequestResponseJSONBody(this._json);

  final JSON _json;

  @override
  JSON get data => _json;

  @override
  toHTMLView() {
    return null;
  }

  @override
  JSON toJson() {
    return _json;
  }

  @override
  String toRaw() {
    const JsonTextFormatter formatter = JsonTextFormatterDefault();

    return formatter.prettyJson(data);
  }

  @override
  List<Object?> get props => [_json];
}

class RequestResponseStringBody extends RequestResponseBody {
  const RequestResponseStringBody(this._string);

  final String _string;

  @override
  String get data => _string;

  @override
  toHTMLView() {
    return _string;
  }

  @override
  String toRaw() {
    return _string;
  }

  @override
  JSON toJson() {
    try {
      final parsed = jsonDecode(_string);
      return parsed;
    } catch (e) {
      return {};
    }
  }

  @override
  List<Object?> get props => [_string];
}
