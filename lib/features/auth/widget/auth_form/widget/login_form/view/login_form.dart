import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_logo_with_text/entity/app_logo_text_size.dart';
import 'package:postmanovich/core/widgets/app_logo_with_text/view/app_logo_with_text.dart';
import 'package:postmanovich/domain/entity/login/login_form_data.dart';
import 'package:postmanovich/features/auth/widget/auth_form/widget/login_form/widget/login_actions.dart';
import 'package:postmanovich/features/auth/widget/auth_form/widget/login_form/widget/login_inputs.dart';
import 'package:postmanovich/features/auth/widget/auth_form/widget/login_form/widget/login_welcome_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passCtrl;
  late final ValueNotifier<bool> _isRemMeNotifier;
  late final ValueNotifier<bool> _showPassNotifier;
  late final FocusNode _emailFc;
  late final FocusNode _passFc;
  late final ValueNotifier<LoginFormData> _loginFormData;

  @override
  void initState() {
    _emailCtrl = TextEditingController()..addListener(_emailListener);
    _passCtrl = TextEditingController()..addListener(_passListener);
    _isRemMeNotifier = ValueNotifier(false)..addListener(_saveLoginListener);
    _showPassNotifier = ValueNotifier(true);
    _emailFc = FocusNode()..requestFocus();
    _passFc = FocusNode();
    _loginFormData = ValueNotifier(
      const LoginFormData(login: null, pass: null, isSaveLogin: false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _isRemMeNotifier.dispose();
    _showPassNotifier.dispose();
    _emailFc.dispose();
    _passFc.dispose();
    _loginFormData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppNumbers.of(context).spacings.x8,
      children: [
        const AppLogoWithText(
          size: AppLogoTextSize.xl,
        ),
        const LoginWelcomeText(),
        LoginInputs(
          emailCtrl: _emailCtrl,
          passwordCtrl: _passCtrl,
          isRememberMe: _isRemMeNotifier,
          showPassNotifier: _showPassNotifier,
          emailFc: _emailFc,
          passFc: _passFc,
        ),
        LoginActions(
          notifier: _loginFormData,
        ),
      ],
    );
  }

  void _emailListener() => _loginFormData.value = _loginFormData.value.copyWith(
        login: _emailCtrl.text,
      );

  void _passListener() => _loginFormData.value = _loginFormData.value.copyWith(
        pass: _passCtrl.text,
      );

  void _saveLoginListener() =>
      _loginFormData.value = _loginFormData.value.copyWith(
        isSaveLogin: _isRemMeNotifier.value,
      );
}
