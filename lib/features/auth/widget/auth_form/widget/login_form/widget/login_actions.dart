import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/domain/entity/login/login_form_data.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({
    super.key,
    required this.notifier,
  });

  final ValueNotifier<LoginFormData> notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppNumbers.of(context).spacings.x3,
      children: [
        ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, value, _) {
              return SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  onTap: value.isFilled ? () {} : null,
                  style: const ElevatedButtonStyle(
                    size: AppButtonSizeXL(),
                  ),
                  child: const Text("Войти"),
                ),
              );
            }),
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            onTap: () {},
            style: const ElevatedButtonStyle(
              size: AppButtonSizeXL(),
              type: AppButtonGhostType(),
            ),
            icon: AppIcon(icon: AppAssets.of(context).google),
            child: const Text("Войти через Google"),
          ),
        ),
      ],
    );
  }
}
