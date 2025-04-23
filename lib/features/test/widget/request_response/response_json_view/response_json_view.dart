import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/core/widgets/json_viewer/json_viewer.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/request/request_response_body.dart';

class ResponseJsonView extends StatelessWidget {
  const ResponseJsonView({
    super.key,
    required this.responseNotifier,
    required this.responseNumbersScrollCtrl,
    required this.responseScrollController,
    required this.controller,
  });

  final ValueNotifier<RequestResponse?> responseNotifier;
  final ScrollController responseNumbersScrollCtrl;
  final ScrollController responseScrollController;
  final JsonTextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: ValueListenableBuilder(
            valueListenable: responseNotifier,
            builder: (context, value, _) {
              if (value == null) {
                return const Center(
                  child: Text(
                    "Ождидаем ответ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              if (value.data is RequestResponseStringBody) {
                final body = value.data as RequestResponseStringBody;

                if (body.data.contains("<HTML>")) {
                  return Html(
                    data: body.data,
                    style: {
                      'body': Style(
                        color: Colors.white,
                      )
                    },
                  );
                }
              }

              return JsonViewer(
                controller: controller,
                numbersCtrl: responseNumbersScrollCtrl,
                jsonCtrl: responseScrollController,
              );
            },
          ),
        ),
      ),
    );
  }
}
