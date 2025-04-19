import 'package:flutter/material.dart';
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
  final ScrollController _verticalScrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
    widget.controller.json.addListener(
      () => widget.onJsonChanged(widget.controller.json.value),
    );
    // Синхронизация скролла между номером строк и содержимым
    _verticalScrollController.addListener(() {
      _horizontalScrollController.jumpTo(_verticalScrollController.offset);
    });
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
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
                Container(
                  width: 40,
                  padding: const EdgeInsets.only(right: 8),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _buildLineNumbers(),
                    ),
                  ),
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
                          fontFamily: 'RobotoMono',
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

  List<Widget> _buildLineNumbers() {
    final lineCount = widget.controller.text.split('\n').length;
    return List<Widget>.generate(
      lineCount,
      (index) => Text(
        '${index + 1}',
        style: const TextStyle(
          color: Colors.grey,
          fontFamily: 'RobotoMono',
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );
  }
}
