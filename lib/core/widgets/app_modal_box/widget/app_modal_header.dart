import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

class AppModalHeader extends StatelessWidget {
  const AppModalHeader({
    super.key,
    required this.headerText,
  });

  final String headerText;

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
            child: Text(
              headerText,
              style: AppTextStyle.of(context).headersSubheader2.copyWith(
                    color: AppColors.of(context).text.primary,
                  ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.all(AppNumbers.of(context).spacings.x1),
              child: AppIcon(
                icon: AppAssets.of(context).xSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
