import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/json_text_area/text_editing_controller/json_text_editing_controller.dart';
import 'package:postmanovich/core/widgets/json_text_area/view/json_text_area.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';

class JsonEditorContent extends StatelessWidget {
  const JsonEditorContent({
    super.key,
    required this.controller,
  });

  final JsonTextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: JsonEditor(
        controller: controller,
        onJsonChanged: (value) => _onJsonChanged(context, value),
      ),
    );
  }

  void _onJsonChanged(BuildContext context, Map<String, dynamic>? value) {
    context.read<RequestBloc>().add(
          ChangeDataRequestEvent(data: value),
        );
  }
}
