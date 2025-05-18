import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_logo_with_text/entity/app_logo_text_size.dart';
import 'package:postmanovich/core/widgets/app_logo_with_text/view/app_logo_with_text.dart';
import 'package:postmanovich/domain/entity/register/register_form_data.dart';
import 'package:postmanovich/features/register/widget/register_form/widget/register_actions.dart';
import 'package:postmanovich/features/register/widget/register_form/widget/register_inputs.dart';
import 'package:postmanovich/features/register/widget/register_form/widget/register_welcome_text.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _usernameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final ValueNotifier<RegisterFormData> _notifier;
  late final ValueNotifier<bool> _showPassword;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController()..addListener(_usernameLstrn);
    _emailController = TextEditingController()..addListener(_emailLstrn);
    _passwordController = TextEditingController()..addListener(_passLstrn);
    _usernameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _notifier = ValueNotifier(const RegisterFormData());
    _showPassword = ValueNotifier(true);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _notifier.dispose();
    _showPassword.dispose();
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
        const RegisterWelcomeText(),
        RegisterInputs(
          usernameCtrl: _usernameController,
          emailCtrl: _emailController,
          passwordCtrl: _passwordController,
          usernameFc: _usernameFocusNode,
          emailFc: _emailFocusNode,
          passwordFc: _passwordFocusNode,
          showPassword: _showPassword,
        ),
        RegisterActions(
          notifier: _notifier,
        ),
      ],
    );
  }

  void _usernameLstrn() => _notifier.value = _notifier.value.copyWith(
        username: _usernameController.text,
      );

  void _emailLstrn() => _notifier.value = _notifier.value.copyWith(
        email: _emailController.text,
      );

  void _passLstrn() => _notifier.value = _notifier.value.copyWith(
        password: _passwordController.text,
      );
}
