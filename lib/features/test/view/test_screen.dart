import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/core/widgets/json_text_area/view/json_text_area.dart';
import 'package:postmanovich/core/widgets/request_url_input/view/request_url_input.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final TextEditingController _urlInputCtrl;
  late final JsonTextEditingController _controller;

  @override
  void initState() {
    _urlInputCtrl = TextEditingController();
    _controller = JsonTextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _urlInputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestUrlInput(
              width: double.infinity,
              height: 45,
              controller: _urlInputCtrl,
              onCurlInsert: (context) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("onCurlInsert"),
                ),
              ),
              onCurlCreated: (arg, context) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("onCurlCreated: ${arg.toString()}"),
                  ),
                );

                if (arg.body != null) {
                  _controller.text = arg.body!.toView();
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: JsonEditor(
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
