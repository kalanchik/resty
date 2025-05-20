import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/context_menu/view/project_context_menu.dart';
import 'package:postmanovich/core/widgets/project_tags/entity/project_tag_type.dart';
import 'package:postmanovich/core/widgets/project_tags/view/project_tags.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.of(context).bs.layerAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppNumbers.of(context).brRadius.m,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppNumbers.of(context).spacings.x3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Project 2",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.of(context).textBody1.copyWith(
                            color: AppColors.of(context).text.primary,
                          ),
                    ),
                  ),
                  ProjectContextMenu(
                    onOpen: () {},
                    onCopy: () {},
                    onInviteCreate: () {},
                    onDelete: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AppIcon(
                        icon: AppAssets.of(context).menuDots,
                        color: AppColors.of(context).icons.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppNumbers.of(context).spacings.x2,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "Lobortis, varius elit faucibus porta varius tincidunt consectetur Donec enim. facilisis eget porta nec faucibus Praesent nulla, non dolor ex lacus, Nunc sit  asdadsa dasdasd dasdjasd ajndja sdasdnjasd anajd ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: AppTextStyle.of(context).textBody3.copyWith(
                        color: AppColors.of(context).text.secondary,
                      ),
                ),
              ),
              Wrap(
                spacing: AppNumbers.of(context).spacings.x2,
                runSpacing: AppNumbers.of(context).spacings.x1,
                children: const [
                  ProjectTags(text: "Process"),
                  ProjectTags(
                    text: "Popular",
                    type: ProjectTagBrandType(),
                  ),
                  ProjectTags(
                    text: "Popular",
                    type: ProjectTagPositiveType(),
                  ),
                  ProjectTags(
                    text: "Popular",
                    type: ProjectTagDangerType(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
