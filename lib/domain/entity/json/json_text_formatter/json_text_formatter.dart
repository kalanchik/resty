import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';

abstract class JsonTextFormatter extends Equatable {
  const JsonTextFormatter();

  String? format(String input);

  String prettyJson(dynamic data);

  Map<String, dynamic>? toJson(String input);
}

class JsonTextFormatterDefault implements JsonTextFormatter {
  const JsonTextFormatterDefault();

  @override
  String? format(String input) {
    try {
      final parsed = jsonDecode(input);
      final formatted = prettyJson(parsed);
      return formatted;
    } catch (e) {
      return null;
    }
  }

  @override
  String prettyJson(dynamic data) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;

  @override
  Map<String, dynamic>? toJson(String input) {
    try {
      return jsonDecode(input) as Map<String, dynamic>;
    } catch (e) {
      log("JSON PARSE ERROR: ${e.toString()}");
      return null;
    }
  }
}
