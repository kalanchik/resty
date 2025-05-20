import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';

class MainContentBox extends StatelessWidget {
  const MainContentBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppNumbers.of(context).spacings.x3,
          vertical: AppNumbers.of(context).spacings.x6,
        ),
        child: child,
      ),
    );
  }
}
