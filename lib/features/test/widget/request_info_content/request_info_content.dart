import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/features/test/widget/request_info_content/editor_content/json_editor_content.dart';
import 'package:postmanovich/features/test/widget/request_info_content/headers_content/request_headers_content.dart';
import 'package:postmanovich/features/test/widget/request_info_content/params_content/request_params_content.dart';

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
          0 => RequestParamsContent(key: ValueKey<int>(value)),
          1 => RequestHeadersContent(
              key: ValueKey<int>(value),
            ),
          2 => JsonEditorContent(
              key: ValueKey<int>(value),
              controller: jsonCtrl,
            ),
          _ => Placeholder(
              key: ValueKey<int>(value),
            ),
        };
      },
    );
  }
}
