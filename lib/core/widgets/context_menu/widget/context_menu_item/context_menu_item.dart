import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/context_menu/widget/context_menu_item/context_menu_item_type.dart';

class ContextMenuItem extends StatefulWidget {
  const ContextMenuItem({
    super.key,
    this.iconPath,
    this.type,
    required this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final ContextMenuItemType? type;
  final String? iconPath;
  final String text;

  @override
  State<ContextMenuItem> createState() => _ContextMenuItemState();
}

class _ContextMenuItemState extends State<ContextMenuItem> {
  bool isHovered = false;

  void onHover(bool value) {
    setState(() {
      isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: onHover,
      hoverColor: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isHovered
              ? widget.type?.hoverColor(context) ??
                  AppColors.of(context).bs.hover
              : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppNumbers.of(context).brRadius.xs2,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppNumbers.of(context).spacings.x1_5),
          child: Row(
            spacing: AppNumbers.of(context).spacings.x2,
            children: [
              if (widget.iconPath != null) ...{
                AppIcon(
                  icon: widget.iconPath!,
                  color: widget.onTap == null
                      ? AppColors.of(context).icons.ghost
                      : isHovered
                          ? widget.type?.iconColor(context) ??
                              AppColors.of(context).icons.primary
                          : AppColors.of(context).icons.primary,
                ),
              },
              Text(
                widget.text,
                style: AppTextStyle.of(context).textBody3.copyWith(
                      color: widget.onTap == null
                          ? AppColors.of(context).text.ghost
                          : isHovered
                              ? widget.type?.textColor(context) ??
                                  AppColors.of(context).text.primary
                              : AppColors.of(context).text.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
