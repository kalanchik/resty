import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:postmanovich/features/register/bloc/register_bloc.dart';
import 'package:postmanovich/features/register/widget/register_form/view/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(context.read<UserUseCase>()),
      child: Scaffold(
        body: Column(
          children: [
            WindowTitleBarBox(),
            const Expanded(
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: RegisterForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
