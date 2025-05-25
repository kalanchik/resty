import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';

class AppModalBox extends StatelessWidget {
  const AppModalBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 450,
        child: Material(
          color: Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.of(context).bs.layer,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppNumbers.of(context).brRadius.m,
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
