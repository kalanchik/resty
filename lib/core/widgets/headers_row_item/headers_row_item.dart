import 'package:flutter/material.dart';

class HeadersRowItem extends StatefulWidget {
  const HeadersRowItem({
    super.key,
    required this.entry,
    required this.onChanged,
  });

  final MapEntry<String, String>? entry;
  final ValueChanged<MapEntry<String, String>> onChanged;

  @override
  State<HeadersRowItem> createState() => _HeadersRowItemState();
}

class _HeadersRowItemState extends State<HeadersRowItem> {
  late final TextEditingController _keyController;
  late final TextEditingController _valueController;
  late final FocusNode _keyFocusNode;
  late final FocusNode _valueFocusNode;

  @override
  void initState() {
    _keyController = TextEditingController(
      text: widget.entry?.key,
    );
    _valueController = TextEditingController(
      text: widget.entry?.value,
    );
    _keyFocusNode = FocusNode();
    _valueFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    _keyFocusNode.dispose();
    _valueFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _keyController,
                onEditingComplete: () {
                  widget.onChanged(
                    MapEntry(
                      _keyController.text,
                      _valueController.text,
                    ),
                  );

                  if (_valueController.text.isEmpty) {
                    _valueFocusNode.requestFocus();
                  }
                },
                focusNode: _keyFocusNode,
                decoration: const InputDecoration(
                  hintText: "Key",
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _valueController,
                onEditingComplete: () {
                  widget.onChanged(
                    MapEntry(
                      _keyController.text,
                      _valueController.text,
                    ),
                  );

                  _valueFocusNode.unfocus();
                },
                focusNode: _valueFocusNode,
                decoration: const InputDecoration(
                  hintText: "Value",
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
