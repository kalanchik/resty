import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/features/test/bloc/request_bloc.dart';

class RequestListener extends StatelessWidget {
  const RequestListener({
    super.key,
    required this.onUrlChanged,
    required this.child,
  });

  final Widget child;
  final ValueChanged<String> onUrlChanged;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<RequestBloc>(),
      listener: (context, state) {
        if (state is RequestChangeUrl) {
          onUrlChanged(state.newUrl);
          return;
        }
      },
      child: child,
    );
  }
}
