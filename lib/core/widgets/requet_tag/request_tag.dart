import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

enum RequestTagType { tGet, post, put, patch, delete, head, options }

extension RequestTagTypeAddon on RequestTagType {
  Color getColor(BuildContext context) {
    return switch (this) {
      RequestTagType.tGet => AppColors.of(context).text.positive,
      RequestTagType.post => AppColors.of(context).text.warn,
      RequestTagType.put => AppColors.of(context).text.info,
      RequestTagType.patch => const Color(0xFFF77CFF).withValues(alpha: .75),
      RequestTagType.delete => AppColors.of(context).text.danger,
      RequestTagType.head => AppColors.of(context).button.positiveActive,
      RequestTagType.options => AppColors.of(context).button.brandActive,
    };
  }

  String get textName {
    return switch (this) {
      RequestTagType.tGet => "GET",
      RequestTagType.post => "POST",
      RequestTagType.put => "PUT",
      RequestTagType.patch => "PATCH",
      RequestTagType.delete => "DELETE",
      RequestTagType.head => "HEAD",
      RequestTagType.options => "OPTIONS",
    };
  }
}

enum RequestTagSize { xs, s, l, xl }

extension RequestTagSizeTextStyle on RequestTagSize {
  TextStyle textStyle(BuildContext context) {
    return switch (this) {
      RequestTagSize.xs => AppTextStyle.of(context).buttonsxs,
      RequestTagSize.s => AppTextStyle.of(context).buttonss,
      RequestTagSize.l => AppTextStyle.of(context).buttonsl,
      RequestTagSize.xl => AppTextStyle.of(context).buttonsxl,
    };
  }
}

class RequestTag extends StatelessWidget {
  const RequestTag({
    super.key,
    this.size = RequestTagSize.xs,
    this.type = RequestTagType.tGet,
  });

  final RequestTagSize size;
  final RequestTagType type;

  @override
  Widget build(BuildContext context) {
    return Text(
      type.textName,
      style: size.textStyle(context).copyWith(
            color: type.getColor(context),
          ),
    );
  }
}
