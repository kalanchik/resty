import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';

class ContextMenuBox extends StatelessWidget {
  const ContextMenuBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 350,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.of(context).bs.dropdown,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppNumbers.of(context).brRadius.m,
            ),
          ),
          border: Border.all(
            color: AppColors.of(context).input.border,
          ),
        ),
        child: IntrinsicWidth(child: child),
      ),
    );
  }
}
