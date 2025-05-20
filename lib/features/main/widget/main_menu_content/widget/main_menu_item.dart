import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

class MainMenuItem extends StatelessWidget {
  const MainMenuItem({
    super.key,
    this.isActive = false,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final bool isActive;
  final VoidCallback onTap;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isActive ? null : onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(AppNumbers.of(context).brRadius.s),
        ),
        hoverColor: AppColors.of(context).bs.layerHover,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.of(context).bs.layerAccent
                : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(AppNumbers.of(context).brRadius.s),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppNumbers.of(context).spacings.x4,
              vertical: AppNumbers.of(context).spacings.x1_5,
            ),
            child: Row(
              spacing: AppNumbers.of(context).spacings.x2,
              children: [
                icon,
                Text(
                  title,
                  style: AppTextStyle.of(context).textBody3.copyWith(
                        color: AppColors.of(context).text.secondary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
