import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';
import 'package:postmanovich/core/widgets/app_text_input/view/app_text_input.dart';

class AppFormControl extends StatelessWidget {
  const AppFormControl({
    super.key,
    required this.title,
    this.titleStyle,
    required this.caption,
    this.captionStyle,
    required this.controller,
    this.size = const AppTextInputSizeM(),
    this.hintText,
    this.leftIcon,
    this.rightIcon,
    this.errorText,
    this.onLayer = false,
  });

  // AppFormControl params

  final String? title;
  final TextStyle? titleStyle;
  final String? caption;
  final TextStyle? captionStyle;

  // AppTextInput params

  final TextEditingController controller;
  final AppTextInputSize size;
  final String? hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? errorText;
  final bool onLayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppNumbers.of(context).spacings.x1,
      children: [
        if (title != null) ...{
          Text(
            title!,
            style: titleStyle ??
                AppTextStyle.of(context).textBody3.copyWith(
                      color: AppColors.of(context).text.secondary,
                    ),
          ),
        },
        AppTextInput(
          controller: controller,
          size: size,
          hintText: hintText,
          onLayer: onLayer,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
          errorText: errorText,
        ),
        if (caption != null) ...{
          Text(
            caption!,
            style: captionStyle ??
                AppTextStyle.of(context).textBody3.copyWith(
                      color: AppColors.of(context).text.secondary,
                    ),
          ),
        },
      ],
    );
  }
}
