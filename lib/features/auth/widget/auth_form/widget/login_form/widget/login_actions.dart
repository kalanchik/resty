import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/domain/entity/login/login_form_data.dart';
import 'package:postmanovich/features/auth/bloc/login_bloc.dart';

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
              child: BlocConsumer<LoginBloc, LoginState>(
                bloc: context.read<LoginBloc>(),
                listener: (context, state) {
                  if (state is LoginError) {
                    AppToast.show(
                      context,
                      title: "Ошибка",
                      type: const SnackBarTypeDanger(isFilled: true),
                      body: state.error.viewMessage(context),
                    );
                    return;
                  }
                  if (state is LoginSuccess) {
                    AppToast.show(
                      context,
                      title: "Успех",
                      type: const SnackBarTypePositive(isFilled: true),
                      body: "Вы вошли в аккаунт",
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const AppElevatedButton(
                      onTap: null,
                      style: ElevatedButtonStyle(
                        size: AppButtonSizeXL(),
                      ),
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AppElevatedButton(
                    onTap: value.isFilled
                        ? () {
                            TextInput.finishAutofillContext();
                            context.read<LoginBloc>().add(
                                  FetchLoginEvent(
                                      email: value.login!,
                                      password: value.pass!),
                                );
                          }
                        : null,
                    style: const ElevatedButtonStyle(
                      size: AppButtonSizeXL(),
                    ),
                    child: const Text("Войти"),
                  );
                },
              ),
            );
          },
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppNumbers.of(context).spacings.x3,
          children: [
            Text(
              "Нет аккаунта?",
              style: AppTextStyle.of(context).textBody3.copyWith(
                    color: AppColors.of(context).text.secondary,
                  ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go("/register"),
                child: Text(
                  "Зарегистрироваться",
                  style: AppTextStyle.of(context).buttonsl.copyWith(
                        color: AppColors.of(context).text.brand,
                      ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
