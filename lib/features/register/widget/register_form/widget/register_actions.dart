import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/domain/entity/register/register_form_data.dart';
import 'package:postmanovich/features/register/bloc/register_bloc.dart';

class RegisterActions extends StatelessWidget {
  const RegisterActions({
    super.key,
    required this.notifier,
  });

  final ValueNotifier<RegisterFormData> notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppNumbers.of(context).spacings.x3,
      children: [
        ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, _) => SizedBox(
            width: double.infinity,
            child: BlocConsumer<RegisterBloc, RegisterState>(
              bloc: context.read<RegisterBloc>(),
              listener: (context, state) {
                if (state is RegisterError) {
                  AppToast.show(
                    context,
                    title: "Ошибка",
                    type: const SnackBarTypeDanger(isFilled: true),
                    body: state.error.viewMessage(context),
                  );
                  return;
                }
                if (state is RegisterSuccess) {
                  AppToast.show(
                    context,
                    title: "Успех",
                    type: const SnackBarTypePositive(isFilled: true),
                    body: "Аккаунт создан",
                  );
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const AppElevatedButton(
                    style: ElevatedButtonStyle(
                      size: AppButtonSizeXL(),
                    ),
                    onTap: null,
                    child: CircularProgressIndicator(),
                  );
                }
                return AppElevatedButton(
                  style: const ElevatedButtonStyle(
                    size: AppButtonSizeXL(),
                  ),
                  onTap: value.isValid
                      ? () {
                          context.read<RegisterBloc>().add(FetchRegisterEvent(
                                username: value.username!,
                                email: value.email!,
                                password: value.password!,
                              ));
                        }
                      : null,
                  child: const Text("Создать аккаунт"),
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppNumbers.of(context).spacings.x2,
          children: [
            Text(
              "Уже есть аккаунт?",
              style: AppTextStyle.of(context).textBody3.copyWith(
                    color: AppColors.of(context).text.ghost,
                  ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go("/"),
                child: Text(
                  "Войти",
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
