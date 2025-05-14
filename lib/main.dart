import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/di/core_di.dart';
import 'package:postmanovich/core/root/app_root.dart';
import 'package:postmanovich/features/auth/view/auth_screen.dart';

void main() {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );

  runApp(
    CoreDi(
      child: AppRoot(
        router: router,
      ),
    ),
  );
}
