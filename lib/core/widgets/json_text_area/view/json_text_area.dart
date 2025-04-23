import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postmanovich/core/widgets/column_numbers_builder/column_numbers_builder.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';

class JsonEditor extends StatefulWidget {
  const JsonEditor({
    super.key,
    required this.controller,
    required this.onJsonChanged,
  });

  final JsonTextEditingController controller;
  final ValueChanged<Map<String, dynamic>?> onJsonChanged;

  @override
  State<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends State<JsonEditor> {
  late final ScrollController _verticalScrollController;
  late final ScrollController _numbersScrollController;
  late final ScrollController _textScrollController;

  @override
  void initState() {
    super.initState();
    _verticalScrollController = ScrollController();
    _numbersScrollController = ScrollController();
    _textScrollController = ScrollController();

    widget.controller.addListener(_ctrlListener);
    widget.controller.json.addListener(_jsonListener);

    _verticalScrollController.addListener(() {
      _numbersScrollController.jumpTo(_verticalScrollController.offset);
      _textScrollController.jumpTo(_verticalScrollController.offset);
    });
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _numbersScrollController.dispose();
    _textScrollController.dispose();
    widget.controller.removeListener(_ctrlListener);
    widget.controller.json.removeListener(_jsonListener);
    super.dispose();
  }

  void _ctrlListener() {
    setState(() {});
  }

  void _jsonListener() {
    widget.onJsonChanged(widget.controller.json.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: widget.controller.validJson,
                builder: (BuildContext context, bool value, _) {
                  return Text(
                    value ? "Valid" : "Invalid",
                    style: TextStyle(
                      color: value ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnNumbersBuilder(
                  controller: _numbersScrollController,
                  count: widget.controller.text.split("\n").length,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      // Подсветка
                      Positioned.fill(
                        child: SingleChildScrollView(
                          controller: _textScrollController,
                          child: RichText(
                            text: widget.controller.parser.highlight(
                              widget.controller.text,
                            ),
                          ),
                        ),
                      ),

                      // Прозрачный TextField поверх
                      TextField(
                        controller: widget.controller,
                        maxLines: null,
                        expands: true,
                        scrollController: _verticalScrollController,
                        style: GoogleFonts.firaCode(
                          fontSize: 14,
                          color: Colors.transparent,
                          height: 1.5,
                          letterSpacing: 0.0,
                        ),
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
