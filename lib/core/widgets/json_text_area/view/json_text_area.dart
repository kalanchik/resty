import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';

class JsonEditor extends StatefulWidget {
  const JsonEditor({
    super.key,
    required this.controller,
  });

  final JsonTextEditingController controller;

  @override
  State<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends State<JsonEditor> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
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
            child: Stack(
              children: [
                // Подсветка
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: RichText(
                      text: widget.controller.parser
                          .highlight(widget.controller.text),
                    ),
                  ),
                ),

                // Прозрачный TextField поверх
                TextField(
                  controller: widget.controller,
                  maxLines: null,
                  expands: true,
                  style: const TextStyle(
                    color: Colors.transparent,
                    fontFamily: 'RobotoMono',
                    fontSize: 14,
                    height: 1.5,
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
    );
  }
}
