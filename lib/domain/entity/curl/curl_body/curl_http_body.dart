import 'dart:developer';
import 'package:postmanovich/domain/entity/curl/curl_body/curl_body.dart';

abstract class CurlHttpBody extends CurlBody {
  const CurlHttpBody();
}

class CurlHttpBodyMap extends CurlHttpBody {
  const CurlHttpBodyMap(this.data);

  @override
  final Map<String, dynamic> data;

  @override
  String toView() {
    final StringBuffer buffer = StringBuffer();

    buffer.write("{");

    for (var i = 0; i < data.length; i++) {
      final entry = data.entries.elementAt(i);

      buffer.write(
          '"${entry.key}": ${entry.value}${i != data.length - 1 ? ',' : ''}');
    }

    buffer.write("}");

    return buffer.toString();
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
  List<Object?> get props => [data];
}
