import 'package:flutter/material.dart';
import 'package:postmanovich/core/di/listeners_di/user_listener_di.dart';
import 'package:postmanovich/core/di/use_case_di/use_case_provider.dart';
import 'package:postmanovich/core/di/utils/utils_di_provider.dart';

class CoreDi extends StatelessWidget {
  const CoreDi({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UtilsDiProvider(
      child: UseCaseProvider(
        child: UserListenerDi(
          child: child,
        ),
      ),
    );
  }
}
