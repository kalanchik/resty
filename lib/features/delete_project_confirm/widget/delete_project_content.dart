import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_form_control/view/app_form_control.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';
import 'package:postmanovich/features/delete_project_confirm/blocs/delete_name_check/bloc/delete_name_check_bloc.dart';

class DeleteProjectContent extends StatelessWidget {
  const DeleteProjectContent({
    super.key,
    required this.projectName,
    required this.controller,
  });

  final TextEditingController controller;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    final mainStyle = AppTextStyle.of(context).textBody3.copyWith(
          color: AppColors.of(context).text.primary,
        );

    final secondaryStyle = AppTextStyle.of(context).textBody2.copyWith(
          color: AppColors.of(context).text.primary,
        );

    final bloc = context.read<DeleteNameCheckBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppNumbers.of(context).spacings.x3,
        horizontal: AppNumbers.of(context).spacings.x4,
      ),
      child: Column(
        spacing: AppNumbers.of(context).spacings.x2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Введите ",
                  style: mainStyle,
                ),
                TextSpan(
                  text: "«$projectName»",
                  style: secondaryStyle,
                ),
                TextSpan(
                  text: ", чтобы подтвердить удаление",
                  style: mainStyle,
                ),
              ],
            ),
          ),
          BlocBuilder<DeleteNameCheckBloc, DeleteNameCheckState>(
            bloc: bloc,
            builder: (context, state) {
              return AppFormControl(
                title: null,
                caption: null,
                onChanged: (_) => bloc.add(
                  UpdateDeleteNameCheckEvent(controller.text),
                ),
                controller: controller,
                onLayer: true,
                errorText: state is DeleteNameCheckError ? state.message : null,
                size: const AppTextInputSizeXL(),
                hintText: "Введите имя проекта",
              );
            },
          ),
        ],
      ),
    );
  }
}
