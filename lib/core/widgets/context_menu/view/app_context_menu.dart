import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/context_menu/widget/context_menu_box.dart';

typedef ContextMenuItemsBuilder = List<Widget> Function(BuildContext context);

class AppContextMenu extends StatelessWidget {
  const AppContextMenu({
    super.key,
    required this.mainGroup,
    required this.secondaryGroup,
  });

  final List<Widget> mainGroup;
  final List<Widget> secondaryGroup;

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x1,
      vertical: AppNumbers.of(context).spacings.x2,
    );

    return ContextMenuBox(
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppNumbers.of(context).spacings.x1,
              children: mainGroup,
            ),
          ),
          if (secondaryGroup.isNotEmpty) ...{
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.of(context).input.border,
                  ),
                ),
              ),
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppNumbers.of(context).spacings.x1,
                  children: secondaryGroup,
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
