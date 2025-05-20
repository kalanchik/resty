import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/project_tags/entity/project_tag_type.dart';

class ProjectTags extends StatelessWidget {
  const ProjectTags({
    super.key,
    this.type = const ProjectTagInfoType(),
    required this.text,
  });

  final String text;
  final ProjectTagType type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: type.bgColor(context),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppNumbers.of(context).brRadius.l,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppNumbers.of(context).spacings.x_5,
          horizontal: AppNumbers.of(context).spacings.x3,
        ),
        child: Text(
          text,
          style: AppTextStyle.of(context).textBody3.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.42,
                color: type.textColor(context),
              ),
        ),
      ),
    );
  }
}
