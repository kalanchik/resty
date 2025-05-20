import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/window_title_bar/view/window_title_bar.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:postmanovich/features/register/bloc/register_bloc.dart';
import 'package:postmanovich/features/register/widget/register_form/view/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(context.read<UserUseCase>()),
      child: const Scaffold(
        body: Column(
          children: [
            WindowTitleBar(child: null),
            Expanded(
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
