import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_form_control/view/app_form_control.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';

class RegisterInputs extends StatelessWidget {
  const RegisterInputs({
    super.key,
    required this.usernameCtrl,
    required this.emailCtrl,
    required this.passwordCtrl,
    required this.usernameFc,
    required this.emailFc,
    required this.passwordFc,
    required this.showPassword,
  });

  final TextEditingController usernameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;
  final FocusNode usernameFc;
  final FocusNode emailFc;
  final FocusNode passwordFc;
  final ValueNotifier<bool> showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppNumbers.of(context).spacings.x2,
      children: [
        AppFormControl(
          title: "Имя пользователя",
          titleStyle: AppTextStyle.of(context).textBody3.copyWith(
                color: AppColors.of(context).text.primary,
              ),
          caption: null,
          hintText: "Введите имя пользователя",
          controller: usernameCtrl,
          focusNode: usernameFc,
          autoFillHints: const [
            AutofillHints.username,
          ],
          onEditingComplete: () => emailFc.requestFocus(),
          size: const AppTextInputSizeXL(),
        ),
        AppFormControl(
          title: "Почта",
          titleStyle: AppTextStyle.of(context).textBody3.copyWith(
                color: AppColors.of(context).text.primary,
              ),
          caption: null,
          hintText: "Введите вашу почту",
          controller: emailCtrl,
          focusNode: emailFc,
          autoFillHints: const [
            AutofillHints.email,
          ],
          onEditingComplete: () => passwordFc.requestFocus(),
          size: const AppTextInputSizeXL(),
        ),
        ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (context, value, _) => AppFormControl(
            title: "Пароль",
            titleStyle: AppTextStyle.of(context).textBody3.copyWith(
                  color: AppColors.of(context).text.primary,
                ),
            caption: null,
            hintText: "Введите пароль",
            controller: passwordCtrl,
            focusNode: passwordFc,
            autoFillHints: const [
              AutofillHints.password,
            ],
            isObscure: value,
            rightIcon: InkWell(
              onTap: () => showPassword.value = !showPassword.value,
              child: AppIcon(
                icon: value
                    ? AppAssets.of(context).eyeOpen
                    : AppAssets.of(context).eyeClosed,
                color: AppColors.of(context).icons.secondary,
              ),
            ),
            size: const AppTextInputSizeXL(),
            onEditingComplete: () => passwordFc.unfocus(),
          ),
        ),
      ],
    );
  }
}
