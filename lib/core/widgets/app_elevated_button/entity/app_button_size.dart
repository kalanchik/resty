import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

sealed class AppButtonSize {
  const AppButtonSize();

  double height(BuildContext context);
  EdgeInsetsGeometry padding(BuildContext context);
  TextStyle textStyle(BuildContext context);
}

class AppButtonSizeXS extends AppButtonSize {
  const AppButtonSizeXS();

  @override
  double height(BuildContext context) => AppNumbers.of(context).buttonXS;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x3,
        vertical: AppNumbers.of(context).spacings.x1,
      );

  @override
  TextStyle textStyle(BuildContext context) =>
      AppTextStyle.of(context).buttonsxs;
}

class AppButtonSizeS extends AppButtonSize {
  const AppButtonSizeS();

  @override
  double height(BuildContext context) => AppNumbers.of(context).buttonS;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x3,
        vertical: AppNumbers.of(context).spacings.x2,
      );

  @override
  TextStyle textStyle(BuildContext context) =>
      AppTextStyle.of(context).buttonss;
}

class AppButtonSizeM extends AppButtonSize {
  const AppButtonSizeM();

  @override
  double height(BuildContext context) => AppNumbers.of(context).buttonM;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x4,
        vertical: AppNumbers.of(context).spacings.x2_5,
      );

  @override
  TextStyle textStyle(BuildContext context) =>
      AppTextStyle.of(context).buttonss;
}

class AppButtonSizeL extends AppButtonSize {
  const AppButtonSizeL();

  @override
  double height(BuildContext context) => AppNumbers.of(context).buttonL;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x4,
        vertical: AppNumbers.of(context).spacings.x2_5,
      );

  @override
  TextStyle textStyle(BuildContext context) =>
      AppTextStyle.of(context).buttonsl;
}

class AppButtonSizeXL extends AppButtonSize {
  const AppButtonSizeXL();

  @override
  double height(BuildContext context) => AppNumbers.of(context).buttonXL;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x5,
        vertical: AppNumbers.of(context).spacings.x3,
      );

  @override
  TextStyle textStyle(BuildContext context) =>
      AppTextStyle.of(context).buttonsxl;
}

class AppButtonSizeCustom extends AppButtonSize {
  final double _height;
  final EdgeInsetsGeometry _padding;
  final TextStyle _textStyle;

  AppButtonSizeCustom({
    required double height,
    required EdgeInsetsGeometry padding,
    required TextStyle textStyle,
  })  : _height = height,
        _textStyle = textStyle,
        _padding = padding;

  @override
  double height(BuildContext context) => _height;

  @override
  EdgeInsetsGeometry padding(BuildContext context) => _padding;

  @override
  TextStyle textStyle(BuildContext context) => _textStyle;
}
