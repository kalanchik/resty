import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/syntax_parser/json_syntax_parser.dart';
import 'package:postmanovich/domain/entity/json/json_text_formatter/json_text_formatter.dart';

/// Управляет [JsonTextArea]
/// 
/// [parser] - обработывает [text] в [TextSpan]
/// 
/// 
class JsonTextEditingController extends TextEditingController {
  final JsonSyntaxParser parser = JsonSyntaxParser();
  final ValueNotifier<bool> validJson = ValueNotifier(false);
  final JsonTextFormatter formatter;

  JsonTextEditingController({
    String? text,
    this.formatter = const JsonTextFormatterDefault(),
  }) : super(text: text) {
    if (text != null) {
      _formatAndValidate(text);
    }

    addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _formatAndValidate(text);
  }

  String _formatAndValidate(String input) {
    final formatted = formatter.format(input);

    if (formatted == null) {
      validJson.value = false;
      return input;
    }

    validJson.value = true;
    return formatted;
  }

  @override
  set text(String newText) {
    super.text = _formatAndValidate(newText);
    notifyListeners();
  }

  @override
  void dispose() {
    validJson.dispose();
    super.dispose();
  }
}
