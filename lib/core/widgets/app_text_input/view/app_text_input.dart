import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({
    super.key,
    required this.controller,
    this.size = const AppTextInputSizeM(),
    this.hintText,
    this.onLayer = false,
    this.leftIcon,
    this.rightIcon,
    this.errorText,
    this.focusNode,
    this.onEditingComplete,
    this.autoFillHints,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final AppTextInputSize size;
  final String? hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? errorText;
  final bool onLayer;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final List<String>? autoFillHints;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      minLines: 1,
      controller: controller,
      autofillHints: autoFillHints,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      style: AppTextStyle.of(context).textBody3.copyWith(
            color: AppColors.of(context).text.primary,
          ),
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.of(context).textBody3.copyWith(
              color: AppColors.of(context).text.ghost,
            ),
        isDense: true,
        contentPadding: size.padding(context),
        filled: true,
        fillColor: onLayer
            ? AppColors.of(context).input.fillLayer
            : AppColors.of(context).input.fill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppNumbers.of(context).brRadius.s),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppNumbers.of(context).brRadius.s),
          ),
          borderSide: BorderSide(
            color: AppColors.of(context).input.borderBrand,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppNumbers.of(context).brRadius.s),
          ),
          borderSide: BorderSide(
            color: AppColors.of(context).bs.danger,
          ),
        ),
        prefixIcon: leftIcon != null
            ? Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 8,
                  ),
                  child: leftIcon,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 24,
        ),
        suffixIcon: rightIcon != null
            ? Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 8,
                  ),
                  child: rightIcon,
                ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 24,
        ),
        errorStyle: AppTextStyle.of(context).textFootnote.copyWith(
              color: AppColors.of(context).text.danger,
            ),
        errorText: errorText,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
