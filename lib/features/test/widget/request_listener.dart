import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/request/request_response.dart';
import 'package:postmanovich/domain/entity/response/response_status_code.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';

class RequestListener extends StatelessWidget {
  const RequestListener({
    super.key,
    required this.onUrlChanged,
    required this.onResponseChanged,
    required this.child,
  });

  final Widget child;
  final ValueChanged<String> onUrlChanged;
  final ValueChanged<RequestResponse> onResponseChanged;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<RequestBloc>(),
      listener: (context, state) {
        if (state is RequestChangeUrl) {
          onUrlChanged(state.newUrl);
          return;
        }
        if (state is RequestComplete) {
          onResponseChanged(state.response);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: switch (state.response.statusCode) {
                null => Colors.red,
                ResponseStatusCodeSuccess() => Colors.green,
                ResponseStatusCodeRedirect() => Colors.orange,
                ResponseStatusCodeClientError() => Colors.red,
                ResponseStatusCodeServerError() => Colors.red,
                ResponseStatusCodeInfo() => Colors.blue,
              },
              content: Text(
                "Запрос выполнен: ${state.response.statusCode == null ? "" : "${state.response.statusCode!.statusCode} -> "} ${state.response.statusCode == null ? "" : state.response.statusCode!.statusName(context)}",
              ),
            ),
          );
        }
      },
      child: child,
    );
  }
}
