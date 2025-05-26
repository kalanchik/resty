import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

class ProjectApiVersion extends StatelessWidget {
  const ProjectApiVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x3,
      vertical: AppNumbers.of(context).spacings.x1_5,
    );

    final brRadius = BorderRadius.all(
      Radius.circular(AppNumbers.of(context).brRadius.s),
    );

    final textStyle = AppTextStyle.of(context).textFootnote.copyWith(
          color: AppColors.of(context).text.secondary,
        );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.of(context).button.ghost,
        borderRadius: brRadius,
      ),
      child: Padding(
        padding: contentPadding,
        child: Row(
          spacing: AppNumbers.of(context).spacings.x1_5,
          children: [
            AppIcon(
              icon: AppAssets.of(context).gitBranch,
              size: 15,
            ),
            Text(
              "v1.0.0",
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
