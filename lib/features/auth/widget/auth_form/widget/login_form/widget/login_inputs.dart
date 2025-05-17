import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_form_control/view/app_form_control.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({
    super.key,
    required this.emailCtrl,
    required this.passwordCtrl,
    required this.isRememberMe,
    required this.showPassNotifier,
    required this.emailFc,
    required this.passFc,
  });

  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;
  final ValueNotifier<bool> isRememberMe;
  final ValueNotifier<bool> showPassNotifier;
  final FocusNode emailFc;
  final FocusNode passFc;

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          AppFormControl(
            title: "Почта",
            caption: null,
            controller: emailCtrl,
            size: const AppTextInputSizeXL(),
            hintText: "Введите вашу почту",
            autoFillHints: const [
              AutofillHints.email,
            ],
            focusNode: emailFc,
            onEditingComplete: () => passFc.requestFocus(),
          ),
          ValueListenableBuilder(
            valueListenable: showPassNotifier,
            builder: (context, value, _) {
              return AppFormControl(
                title: "Пароль",
                caption: null,
                controller: passwordCtrl,
                size: const AppTextInputSizeXL(),
                hintText: "Введите email",
                autoFillHints: const [
                  AutofillHints.password,
                ],
                rightIcon: InkWell(
                  onTap: () => showPassNotifier.value = !showPassNotifier.value,
                  child: AppIcon(
                    icon: value
                        ? AppAssets.of(context).eyeOpen
                        : AppAssets.of(context).eyeClosed,
                    color: AppColors.of(context).icons.secondary,
                  ),
                ),
                focusNode: passFc,
                onEditingComplete: () => passFc.unfocus(),
                isObscure: value,
              );
            },
          ),
          Row(
            // spacing: AppNumbers.of(context).spacings.x3,
            children: [
              ValueListenableBuilder(
                valueListenable: isRememberMe,
                builder: (context, value, _) {
                  return Checkbox(
                    visualDensity: VisualDensity.compact,
                    checkColor: AppColors.of(context).text.primary,
                    activeColor: AppColors.of(context).bs.brand,
                    splashRadius: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppNumbers.of(context).brRadius.xs),
                      ),
                    ),
                    value: value,
                    onChanged: (newValue) {
                      isRememberMe.value = newValue ?? false;
                    },
                  );
                },
              ),
              Text(
                "Запомнить меня",
                style: AppTextStyle.of(context).textBody3.copyWith(
                      color: AppColors.of(context).text.primary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
