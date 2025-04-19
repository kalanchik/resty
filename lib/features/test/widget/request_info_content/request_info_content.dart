import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/features/test/widget/request_info_content/editor_content/json_editor_content.dart';

class RequestInfoContent extends StatelessWidget {
  const RequestInfoContent({
    super.key,
    required this.jsonCtrl,
    required this.tabNotifier,
  });

  final JsonTextEditingController jsonCtrl;
  final ValueNotifier<int> tabNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabNotifier,
      builder: (context, value, _) {
        return switch (value) {
          0 => const Placeholder(),
          1 => const Placeholder(),
          2 => JsonEditorContent(
              controller: jsonCtrl,
            ),
          _ => Placeholder(),
        };
      },
    );
  }
}
