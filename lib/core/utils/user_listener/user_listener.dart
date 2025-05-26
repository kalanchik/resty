import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/utils/user_listener/bloc/user_listener_bloc.dart';

class UserListener extends StatelessWidget {
  const UserListener({
    super.key,
    required this.child,
    required this.router,
  });

  final GoRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<UserListenerBloc>()..add(StartListeningUserEvent()),
      listener: (context, state) {
        if (state is UserSignInState) {
          final String? path = router.state.fullPath;

          if (path == null || path == "/") {
            router.go("/main");
            return;
          }

          return;
        }
        if (state is UserSignOutState) {
          router.go("/");
          return;
        }
      },
      child: child,
    );
  }
}
