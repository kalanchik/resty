import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

class SnackBarFactory {
  SnackBarFactory._();

  static SnackBar create(
    BuildContext context, {
    required SnackBarType type,
    required String? title,
    required String? body,
    required bool showCloseButton,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SnackBar(
      width: null,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: 60,
        left: (screenWidth - 400),
        right: 30,
      ),
      elevation: 0,
      backgroundColor: type.isFilled ? type.color(context) : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppNumbers.of(context).brRadius.m),
        ),
        side: type.isFilled
            ? BorderSide.none
            : BorderSide(
                color: type.color(context),
              ),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: AppNumbers.of(context).spacings.x3,
        children: [
          type.icon(context),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppNumbers.of(context).spacings.x1,
              children: [
                if (title != null) ...{
                  Text(
                    title,
                    style: AppTextStyle.of(context).headersSubheader2.copyWith(
                          color: AppColors.of(context).text.primary,
                        ),
                  ),
                },
                if (body != null) ...{
                  Text(
                    body,
                    style: AppTextStyle.of(context).textBody3.copyWith(
                          color: AppColors.of(context).text.primary,
                        ),
                  ),
                },
              ],
            ),
          ),
          if (showCloseButton) ...{
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: AppIcon(
                icon: AppAssets.of(context).xSmall,
                color: AppColors.of(context).icons.secondary,
              ),
            ),
          }
        ],
      ),
    );
  }
}
