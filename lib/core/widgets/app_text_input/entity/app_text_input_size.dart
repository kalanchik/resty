import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';

sealed class AppTextInputSize {
  const AppTextInputSize();

  EdgeInsetsGeometry padding(BuildContext context);
}

class AppTextInputSizeM extends AppTextInputSize {
  const AppTextInputSizeM();

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x1_5,
        vertical: AppNumbers.of(context).spacings.x1_5,
      );
}

class AppTextInputSizeL extends AppTextInputSize {
  const AppTextInputSizeL();

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x2,
        vertical: AppNumbers.of(context).spacings.x2,
      );
}

class AppTextInputSizeXL extends AppTextInputSize {
  const AppTextInputSizeXL();

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x3,
        vertical: AppNumbers.of(context).spacings.x3,
      );
}

class AppTextInputSizeS extends AppTextInputSize {
  const AppTextInputSizeS();

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x1,
        vertical: AppNumbers.of(context).spacings.x1,
      );
}
