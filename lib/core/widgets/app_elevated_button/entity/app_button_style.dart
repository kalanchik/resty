import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_view.dart';

abstract class AppButtonStyle {
  const AppButtonStyle();

  ButtonStyle style(BuildContext context);
}

class ElevatedButtonStyle extends AppButtonStyle {
  final AppButtonSize size;
  final AppButtonType type;
  final AppButtonView view;

  const ElevatedButtonStyle({
    this.size = const AppButtonSizeS(),
    this.type = const AppButtonBrandType(),
    this.view = const AppButtonPrimaryView(),
  });

  @override
  ButtonStyle style(BuildContext context) {
    return ButtonStyle(
      padding: WidgetStatePropertyAll(size.padding(context)),
      alignment: Alignment.center,
      backgroundColor: WidgetStateProperty.resolveWith<Color>((state) {
        if (state.contains(WidgetState.disabled)) {
          return AppColors.of(context).button.disabled;
        }

        if (state.contains(WidgetState.hovered)) {
          return switch (view) {
            AppButtonPrimaryView() => type.hoverColor(context),
            AppButtonTransparentView() => type.hoverTranseperetColor(context),
            AppButtonOutlinedView() => type.hoverOutlineColor(context),
          };
        }

        return switch (view) {
          AppButtonPrimaryView() => type.backgroundColor(context),
          AppButtonTransparentView() => Colors.transparent,
          AppButtonOutlinedView() => Colors.transparent,
        };
      }),
      foregroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return AppColors.of(context).text.disabled;
        }

        return switch (view) {
          AppButtonPrimaryView() => type.foregroundColor(context),
          AppButtonTransparentView() =>
            type.foregroundColorTransperent(context),
          AppButtonOutlinedView() => type.foregroundColorTransperent(context),
        };
      }),
      splashFactory: NoSplash.splashFactory,
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        side: switch (view) {
          AppButtonPrimaryView() => BorderSide.none,
          AppButtonTransparentView() => BorderSide.none,
          AppButtonOutlinedView() => BorderSide(
              color: type.borderOutline(context),
            ),
        },
        borderRadius: BorderRadius.circular(
          AppNumbers.of(context).brRadius.s,
        ),
      )),
      textStyle: WidgetStatePropertyAll(size.textStyle(context)),
      minimumSize: const WidgetStatePropertyAll(Size.zero),
      maximumSize: const WidgetStatePropertyAll(Size.infinite),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    );
  }
}
