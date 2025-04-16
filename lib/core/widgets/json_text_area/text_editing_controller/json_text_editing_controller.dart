import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/syntax_parser/json_syntax_parser.dart';

class JsonTextEditingController extends TextEditingController {
  final JsonSyntaxParser parser = JsonSyntaxParser();

  @override
  set text(String newText) {
    super.text = newText;
    notifyListeners();
  }
}
