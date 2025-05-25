import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/features/delete_project_confirm/blocs/bloc/delete_project_bloc.dart';

class DeleteProjectAction extends StatelessWidget {
  const DeleteProjectAction({
    super.key,
    required this.projectId,
    required this.notifier,
  });

  final String projectId;
  final ValueNotifier<bool> notifier;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DeleteProjectBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x4,
        vertical: AppNumbers.of(context).spacings.x3,
      ),
      child: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          return SizedBox(
            width: double.infinity,
            child: BlocConsumer<DeleteProjectBloc, DeleteProjectState>(
              listener: (context, state) {
                if (state is DeleteProjectSuccess) {
                  AppToast.show(
                    context,
                    title: "Успех",
                    type: const SnackBarTypePositive(isFilled: true),
                    body: "Проект удален",
                  );

                  Navigator.of(context).maybePop();
                }
                if (state is DeleteProjectError) {
                  AppToast.show(
                    context,
                    title: "Ошибка",
                    type: const SnackBarTypeDanger(isFilled: true),
                    body: state.error.viewMessage(context),
                  );
                }
              },
              bloc: bloc,
              builder: (context, state) {
                return AppElevatedButton(
                  onTap: value
                      ? () {
                          bloc.add(FetchDeleteProjectEvent(projectId));
                        }
                      : null,
                  style: const ElevatedButtonStyle(
                    size: AppButtonSizeM(),
                    type: AppButtonDangerType(),
                  ),
                  child: state is DeleteProjectLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const Text("Удалить проект"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
