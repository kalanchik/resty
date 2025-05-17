import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_logo/entity/app_logo_size.dart';
import 'package:postmanovich/core/widgets/app_logo/view/app_logo.dart';
import 'package:postmanovich/core/widgets/app_logo_with_text/entity/app_logo_text_size.dart';

class AppLogoWithText extends StatelessWidget {
  const AppLogoWithText({
    super.key,
    this.size = AppLogoTextSize.m,
  });

  final AppLogoTextSize size;

  @override
  Widget build(BuildContext context) {
    final imageSize = switch (size) {
      AppLogoTextSize.xl => AppLogoSize.m,
      AppLogoTextSize.l => AppLogoSize.s,
      AppLogoTextSize.m => AppLogoSize.xs,
    };

    final TextStyle textSize = switch (size) {
      AppLogoTextSize.xl => AppTextStyle.of(context).headersHeader1,
      AppLogoTextSize.l => AppTextStyle.of(context).headersHeader3,
      AppLogoTextSize.m => AppTextStyle.of(context).headersSubheader3,
    };

    return Row(
      children: [
        AppLogo(
          size: imageSize,
        ),
        Text(
          "esty",
          style: textSize.copyWith(
            color: AppColors.of(context).text.brand,
          ),
        ),
      ],
    );
  }
}
