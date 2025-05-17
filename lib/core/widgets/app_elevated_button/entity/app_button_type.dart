import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';

sealed class AppButtonType {
  const AppButtonType();

  Color backgroundColor(BuildContext context);

  Color foregroundColor(BuildContext context);
  Color foregroundColorTransperent(BuildContext context);

  Color hoverColor(BuildContext context);
  Color hoverTranseperetColor(BuildContext context);
  Color hoverOutlineColor(BuildContext context);

  Color borderOutline(BuildContext context);
}

class AppButtonGhostType extends AppButtonType {
  const AppButtonGhostType({Color? foregroundColor})
      : _foregroundColor = foregroundColor;

  final Color? _foregroundColor;

  @override
  Color backgroundColor(BuildContext context) =>
      AppColors.of(context).button.ghost;

  @override
  Color foregroundColor(BuildContext context) =>
      _foregroundColor ?? AppColors.of(context).text.primary;

  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).button.ghostHover;

  @override
  Color borderOutline(BuildContext context) {
    return AppColors.of(context).button.ghost;
  }

  @override
  Color foregroundColorTransperent(BuildContext context) {
    return AppColors.of(context).text.primary;
  }

  @override
  Color hoverOutlineColor(BuildContext context) {
    return AppColors.of(context).button.ghostActive;
  }

  @override
  Color hoverTranseperetColor(BuildContext context) {
    return AppColors.of(context).button.ghostHover;
  }
}

class AppButtonWarnType extends AppButtonType {
  const AppButtonWarnType({Color? foregroundColor})
      : _foregroundColor = foregroundColor;

  final Color? _foregroundColor;

  @override
  Color backgroundColor(BuildContext context) =>
      AppColors.of(context).button.warn;

  @override
  Color foregroundColor(BuildContext context) =>
      _foregroundColor ?? AppColors.of(context).text.lightPrimary;

  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).button.warnHover;

  @override
  Color borderOutline(BuildContext context) {
    return AppColors.of(context).button.warn;
  }

  @override
  Color foregroundColorTransperent(BuildContext context) {
    return AppColors.of(context).text.warn;
  }

  @override
  Color hoverOutlineColor(BuildContext context) {
    return AppColors.of(context).button.warnMedium;
  }

  @override
  Color hoverTranseperetColor(BuildContext context) {
    return AppColors.of(context).button.warnMedium;
  }
}

class AppButtonDangerType extends AppButtonType {
  const AppButtonDangerType({Color? foregroundColor})
      : _foregroundColor = foregroundColor;

  final Color? _foregroundColor;

  @override
  Color backgroundColor(BuildContext context) =>
      AppColors.of(context).button.danger;

  @override
  Color foregroundColor(BuildContext context) =>
      _foregroundColor ?? AppColors.of(context).text.lightPrimary;

  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).button.dangerHover;

  @override
  Color borderOutline(BuildContext context) {
    return AppColors.of(context).button.danger;
  }

  @override
  Color foregroundColorTransperent(BuildContext context) {
    return AppColors.of(context).text.danger;
  }

  @override
  Color hoverOutlineColor(BuildContext context) {
    return AppColors.of(context).button.dangerMedium;
  }

  @override
  Color hoverTranseperetColor(BuildContext context) {
    return AppColors.of(context).button.dangerMedium;
  }
}

class AppButtonPositiveType extends AppButtonType {
  const AppButtonPositiveType({Color? foregroundColor})
      : _foregroundColor = foregroundColor;

  final Color? _foregroundColor;

  @override
  Color backgroundColor(BuildContext context) =>
      AppColors.of(context).button.positive;

  @override
  Color foregroundColor(BuildContext context) =>
      _foregroundColor ?? AppColors.of(context).text.lightPrimary;

  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).button.positiveHover;

  @override
  Color borderOutline(BuildContext context) {
    return AppColors.of(context).button.positive;
  }

  @override
  Color foregroundColorTransperent(BuildContext context) {
    return AppColors.of(context).text.positive;
  }

  @override
  Color hoverOutlineColor(BuildContext context) {
    return AppColors.of(context).button.positiveMedium;
  }

  @override
  Color hoverTranseperetColor(BuildContext context) {
    return AppColors.of(context).button.positiveMedium;
  }
}

class AppButtonBrandType extends AppButtonType {
  const AppButtonBrandType({Color? foregroundColor})
      : _foregroundColor = foregroundColor;

  final Color? _foregroundColor;

  @override
  Color backgroundColor(BuildContext context) =>
      AppColors.of(context).button.brand;

  @override
  Color foregroundColor(BuildContext context) =>
      _foregroundColor ?? AppColors.of(context).text.lightPrimary;

  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).button.brandHover;

  @override
  Color borderOutline(BuildContext context) {
    return AppColors.of(context).button.brand;
  }

  @override
  Color foregroundColorTransperent(BuildContext context) {
    return AppColors.of(context).text.brand;
  }

  @override
  Color hoverOutlineColor(BuildContext context) {
    return AppColors.of(context).button.brandMedium;
  }

  @override
  Color hoverTranseperetColor(BuildContext context) {
    return AppColors.of(context).button.brandMedium;
  }
}
