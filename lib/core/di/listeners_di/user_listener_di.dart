import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/utils/user_listener/bloc/user_listener_bloc.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

class UserListenerDi extends StatelessWidget {
  const UserListenerDi({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListenerBloc(
        context.read<UserUseCase>(),
      ),
      child: child,
    );
  }
}
