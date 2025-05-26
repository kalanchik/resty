import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

class ProjectMenuItem extends StatelessWidget {
  const ProjectMenuItem({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.title,
    required this.iconPath,
  });

  final bool isActive;
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x1,
      vertical: AppNumbers.of(context).spacings.x1_5,
    );

    final iconColor = isActive
        ? AppColors.of(context).icons.brand
        : AppColors.of(context).icons.secondary;

    final textColor = isActive
        ? AppColors.of(context).text.brand
        : AppColors.of(context).text.secondary;

    final textStyle = AppTextStyle.of(context).textFootnote.copyWith(
          color: textColor,
        );

    final borderRadius = BorderRadius.all(
      Radius.circular(AppNumbers.of(context).brRadius.s),
    );

    return SizedBox(
      width: 80,
      child: InkWell(
        onTap: isActive ? null : onTap,
        borderRadius: borderRadius,
        splashFactory: NoSplash.splashFactory,
        hoverColor: AppColors.of(context).bs.hover,
        child: Padding(
          padding: contentPadding,
          child: Column(
            spacing: AppNumbers.of(context).spacings.x2,
            children: [
              AppIcon(
                icon: iconPath,
                size: 16,
                color: iconColor,
              ),
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
