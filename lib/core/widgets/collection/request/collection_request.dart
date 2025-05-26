import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/requet_tag/request_tag.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

class CollectionRequest extends StatelessWidget {
  const CollectionRequest({
    super.key,
    required this.request,
  });

  final RequestItem request;

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x1,
      vertical: AppNumbers.of(context).spacings.x1_5,
    );

    final brRadius = BorderRadius.all(
      Radius.circular(AppNumbers.of(context).brRadius.xs2),
    );

    return InkWell(
      onTap: () {},
      hoverColor: AppColors.of(context).bs.hover,
      borderRadius: brRadius,
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: contentPadding,
        child: Row(
          spacing: AppNumbers.of(context).spacings.x2,
          children: [
            RequestTag(
              type: switch (request.method) {
                HttpMethodGet() => RequestTagType.tGet,
                HttpMethodPost() => RequestTagType.post,
              },
            ),
            Text(
              request.name,
              style: AppTextStyle.of(context).textFootnote.copyWith(
                    color: AppColors.of(context).text.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
