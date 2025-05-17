import 'package:bitsdojo_window/bitsdojo_window.dart';
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

  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
