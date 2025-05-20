import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/window_title_bar/view/window_title_bar.dart';
import 'package:postmanovich/features/auth/widget/auth_form/view/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WindowTitleBar(child: null),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                AppNumbers.of(context).spacings.x16,
              ),
              child: Row(
                spacing: AppNumbers.of(context).spacings.x6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AuthForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
