import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppNumbers.of(context).spacings.x2,
      children: [
        Text(
          "С возвращением в Resty!",
          style: AppTextStyle.of(context).headersHeader1.copyWith(
                color: AppColors.of(context).text.primary,
              ),
        ),
        Text(
          "Resty самый быстрый и удобный помощник, написанный на Flutter, для тестирования вашего API",
          style: AppTextStyle.of(context).headersSubheader2.copyWith(
                color: AppColors.of(context).text.secondary,
              ),
        ),
      ],
    );
  }
}
