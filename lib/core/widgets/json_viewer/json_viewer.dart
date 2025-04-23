import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/column_numbers_builder/column_numbers_builder.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';

class JsonViewer extends StatefulWidget {
  const JsonViewer({
    super.key,
    required this.controller,
    this.jsonCtrl,
    this.numbersCtrl,
  });

  final JsonTextEditingController controller;
  final ScrollController? numbersCtrl;
  final ScrollController? jsonCtrl;

  @override
  State<JsonViewer> createState() => _JsonViewerState();
}

class _JsonViewerState extends State<JsonViewer> {
  late final ScrollController _numbersCtrl;
  late final ScrollController _jsonCtrl;

  @override
  void initState() {
    _initDep();
    super.initState();
  }

  @override
  void dispose() {
    _disposeDep();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ColumnNumbersBuilder(
          controller: _numbersCtrl,
          count: widget.controller.text.split("\n").length,
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _jsonCtrl,
            child: SelectableText.rich(
              widget.controller.parser.highlight(
                widget.controller.text,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _initDep() {
    _numbersCtrl = widget.numbersCtrl ?? ScrollController();
    _jsonCtrl = widget.jsonCtrl ?? ScrollController()
      ..addListener(() {
        _numbersCtrl.jumpTo(_jsonCtrl.offset);
      });
  }

  void _disposeDep() {
    widget.jsonCtrl == null ? _jsonCtrl.dispose() : null;
    widget.numbersCtrl == null ? _numbersCtrl.dispose() : null;
  }
}
