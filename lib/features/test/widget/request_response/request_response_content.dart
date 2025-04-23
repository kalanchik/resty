import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/features/test/widget/request_response/request_response_tab_bar.dart';
import 'package:postmanovich/features/test/widget/request_response/response_headers_view/response_headers_view.dart';
import 'package:postmanovich/features/test/widget/request_response/response_info_row/response_info_row.dart';
import 'package:postmanovich/features/test/widget/request_response/response_json_view/response_json_view.dart';

class RequestResponseContent extends StatelessWidget {
  const RequestResponseContent({
    super.key,
    required this.tabController,
    required this.responseNotifier,
    required this.responseScrollController,
    required this.responseCtrl,
    required this.responseNumbersScrollCtrl,
    required this.responseTabNotifier,
  });

  final TabController tabController;
  final ValueNotifier<RequestResponse?> responseNotifier;
  final ScrollController responseScrollController;
  final JsonTextEditingController responseCtrl;
  final ScrollController responseNumbersScrollCtrl;
  final ValueNotifier<int> responseTabNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
            ),
          ),
        ),
        child: Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12.0,
              children: [
                RequestResponseTabBar(
                  controller: tabController,
                ),
                ResponseInfoRow(
                  responseNotifier: responseNotifier,
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: responseTabNotifier,
              builder: (context, value, _) => switch (value) {
                1 => ResponseHeadersView(responseNotifier: responseNotifier),
                _ => ResponseJsonView(
                    responseNotifier: responseNotifier,
                    responseNumbersScrollCtrl: responseNumbersScrollCtrl,
                    responseScrollController: responseScrollController,
                    controller: responseCtrl,
                  ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
