import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

@immutable
abstract class SnackBarType {
  const SnackBarType();

  bool get isFilled;

  Color color(BuildContext context);
  Widget icon(BuildContext context);
}

class SnackBarTypeInfo extends SnackBarType {
  const SnackBarTypeInfo({required this.isFilled});

  @override
  final bool isFilled;

  @override
  Color color(BuildContext context) {
    return isFilled
        ? AppColors.of(context).bs.infoLight
        : AppColors.of(context).bs.info;
  }

  @override
  Widget icon(BuildContext context) {
    return AppIcon(
      icon: isFilled
          ? AppAssets.of(context).infoFilled
          : AppAssets.of(context).infoOutline,
      color: AppColors.of(context).icons.info,
    );
  }
}

class SnackBarTypeWarn extends SnackBarType {
  @override
  final bool isFilled;

  const SnackBarTypeWarn({
    required this.isFilled,
  });

  @override
  Color color(BuildContext context) {
    return isFilled
        ? AppColors.of(context).bs.warnLight
        : AppColors.of(context).bs.warn;
  }

  @override
  Widget icon(BuildContext context) {
    return AppIcon(
      icon: isFilled
          ? AppAssets.of(context).warnFilled
          : AppAssets.of(context).warnOutline,
      color: AppColors.of(context).icons.warn,
    );
  }
}

class SnackBarTypeDanger extends SnackBarType {
  @override
  final bool isFilled;

  const SnackBarTypeDanger({
    required this.isFilled,
  });

  @override
  Color color(BuildContext context) {
    return isFilled
        ? AppColors.of(context).bs.dangerLight
        : AppColors.of(context).bs.danger;
  }

  @override
  Widget icon(BuildContext context) {
    return AppIcon(
      icon: isFilled
          ? AppAssets.of(context).dangerFilled
          : AppAssets.of(context).dangerOutline,
      color: AppColors.of(context).icons.danger,
    );
  }
}

class SnackBarTypePositive extends SnackBarType {
  @override
  final bool isFilled;

  const SnackBarTypePositive({required this.isFilled});

  @override
  Color color(BuildContext context) {
    return isFilled
        ? AppColors.of(context).bs.positiveLight
        : AppColors.of(context).bs.positive;
  }

  @override
  Widget icon(BuildContext context) {
    return AppIcon(
      icon: isFilled
          ? AppAssets.of(context).successFilled
          : AppAssets.of(context).successOutline,
      color: AppColors.of(context).icons.positive,
    );
  }
}

class SnackBarTypeQuestion extends SnackBarType {
  @override
  final bool isFilled;

  const SnackBarTypeQuestion({required this.isFilled});

  @override
  Color color(BuildContext context) {
    return AppColors.of(context).bs.tooltip;
  }

  @override
  Widget icon(BuildContext context) {
    return AppIcon(
      icon: isFilled
          ? AppAssets.of(context).questionFilled
          : AppAssets.of(context).questionOutline,
      color: AppColors.of(context).icons.secondary,
    );
  }
}
