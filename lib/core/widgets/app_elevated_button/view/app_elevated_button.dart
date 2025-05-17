import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.style = const ElevatedButtonStyle(),
    this.icon,
    required this.child,
  });

  final AppButtonStyle style;
  final Widget? icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style.style(context),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          if (icon != null) ...{
            icon!,
          },
          child,
        ],
      ),
    );
  }
}
