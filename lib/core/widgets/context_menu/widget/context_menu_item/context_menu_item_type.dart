import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';

@immutable
abstract class ContextMenuItemType {
  Color hoverColor(BuildContext context);
  Color textColor(BuildContext context);
  Color iconColor(BuildContext context);
}

class ContextMenuItemTypeDanger extends ContextMenuItemType {
  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).bs.dangerLight;

  @override
  Color iconColor(BuildContext context) {
    return AppColors.of(context).icons.danger;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.danger;
  }
}

class ContextMenuItemTypeWarn extends ContextMenuItemType {
  @override
  Color hoverColor(BuildContext context) => AppColors.of(context).bs.warnLight;

  @override
  Color iconColor(BuildContext context) {
    return AppColors.of(context).icons.warn;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.warn;
  }
}

class ContextMenuItemTypePositive extends ContextMenuItemType {
  @override
  Color hoverColor(BuildContext context) =>
      AppColors.of(context).bs.positiveLight;

  @override
  Color iconColor(BuildContext context) {
    return AppColors.of(context).icons.positive;
  }

  @override
  Color textColor(BuildContext context) {
    return AppColors.of(context).text.positive;
  }
}
