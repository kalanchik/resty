import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/features/project_create/bloc/project_create_bloc.dart';

class ProjectCreateActions extends StatelessWidget {
  const ProjectCreateActions({super.key, required this.paramsNotifier});

  final ValueNotifier<ProjectCreateParams> paramsNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x4,
        vertical: AppNumbers.of(context).spacings.x3,
      ),
      child: Row(
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          Expanded(
            child: AppElevatedButton(
              onTap: () => Navigator.pop(context),
              style: const ElevatedButtonStyle(
                type: AppButtonGhostType(),
                size: AppButtonSizeM(),
              ),
              child: const Text("Отменить"),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: paramsNotifier,
              builder: (context, value, _) {
                if (!value.isFilled) {
                  return const AppElevatedButton(
                    onTap: null,
                    style: ElevatedButtonStyle(
                      type: AppButtonPositiveType(),
                      size: AppButtonSizeM(),
                    ),
                    child: Text("Создать"),
                  );
                }

                return BlocConsumer<ProjectCreateBloc, ProjectCreateState>(
                  bloc: context.read<ProjectCreateBloc>(),
                  listener: (context, state) {
                    if (state is ProjectCreateSuccess) {
                      Navigator.of(context).maybePop();
                      AppToast.show(
                        context,
                        type: const SnackBarTypePositive(isFilled: true),
                        title: "Успех",
                        body: "Проект создан",
                      );
                      return;
                    }
                    if (state is ProjectCreateError) {
                      AppToast.show(
                        context,
                        type: const SnackBarTypeDanger(isFilled: true),
                        title: "Ошибка",
                        body: state.error.viewMessage(context),
                      );
                      return;
                    }
                  },
                  builder: (context, state) {
                    return AppElevatedButton(
                      onTap: () {
                        context.read<ProjectCreateBloc>().add(
                              FetchProjectCreateEvent(value),
                            );
                      },
                      style: const ElevatedButtonStyle(
                        type: AppButtonPositiveType(),
                        size: AppButtonSizeM(),
                      ),
                      child: const Text("Создать"),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
