import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/app_text_input/view/app_text_input.dart';
import 'package:postmanovich/features/project_api/widget/project_api_collections/widget/project_api_version.dart';

class ProjectApiCollectionsHeader extends StatelessWidget {
  const ProjectApiCollectionsHeader({
    super.key,
    required this.projectName,
    required this.controller,
  });

  final String projectName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.of(context).textBody1.copyWith(
          color: AppColors.of(context).text.primary,
        );

    return Column(
      spacing: AppNumbers.of(context).spacings.x2,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                projectName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ),
            const ProjectApiVersion(),
          ],
        ),
        AppTextInput(
          controller: controller,
          onLayer: true,
          hintText: "Поиск по имени",
          leftIcon: AppIcon(
            icon: AppAssets.of(context).searchIcon,
          ),
        ),
      ],
    );
  }
}
