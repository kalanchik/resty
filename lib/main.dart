import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/di/core_di.dart';
import 'package:postmanovich/core/root/app_root.dart';
import 'package:postmanovich/features/auth/view/auth_screen.dart';
import 'package:postmanovich/features/main/view/main_screen.dart';
import 'package:postmanovich/features/project/view/project_screen.dart';
import 'package:postmanovich/features/register/view/register_screen.dart';
import 'package:postmanovich/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: "/main",
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: "/project/:id",
        builder: (context, state) => ProjectScreen(
          projectId: state.pathParameters['id'] as String,
        ),
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
