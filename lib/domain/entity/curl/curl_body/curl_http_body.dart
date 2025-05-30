import 'dart:convert';
import 'dart:developer';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_body.dart';
import 'package:postmanovich/domain/entity/json/json_text_formatter/json_text_formatter.dart';

abstract class CurlHttpBody extends CurlBody {
  const CurlHttpBody();
}

class CurlHttpBodyMap extends CurlHttpBody {
  const CurlHttpBodyMap(this.data);

  @override
  final Map<String, dynamic> data;

  @override
  String toView() {
    const JsonTextFormatter formatter = JsonTextFormatterDefault();

    return formatter.prettyJson(data);
  }

  @override
  String toJsonString() {
    return jsonEncode(data);
  }

  @override
  List<Object?> get props => [data];
}

class CurlHttpBodyList extends CurlHttpBody {
  const CurlHttpBodyList(this.data);

  @override
  final List<dynamic> data;

  @override
  String toView() {
    log("LIST: ${data.toString()}");
    return data.toString();
  }

  @override
  String toJsonString() {
    return jsonEncode(data);
  }

  @override
  List<Object?> get props => [data];
}

class CurlHttpBodyString extends CurlHttpBody {
  const CurlHttpBodyString(this.data);

  @override
  final String data;

  @override
  String toView() {
    log("STRING: ${data.toString()}");
    return data;
  }

  @override
  String toJsonString() {
    return data;
  }

  @override
  List<Object?> get props => [data];
}
