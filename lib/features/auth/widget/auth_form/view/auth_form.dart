import 'package:flutter/material.dart';
import 'package:postmanovich/features/auth/widget/auth_form/widget/login_form/view/login_form.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: LoginForm(),
    );
  }
}
