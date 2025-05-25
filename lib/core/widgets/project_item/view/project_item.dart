import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/context_menu/view/project_context_menu.dart';
import 'package:postmanovich/core/widgets/project_tags/entity/project_tag_type.dart';
import 'package:postmanovich/core/widgets/project_tags/view/project_tags.dart';
import 'package:postmanovich/domain/entity/project/project_info.dart';
import 'package:postmanovich/features/delete_project_confirm/view/delete_project_modal.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.project,
    required this.onTap,
  });

  final VoidCallback onTap;
  final ProjectInfo project;

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
                      project.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.of(context).textBody1.copyWith(
                            color: AppColors.of(context).text.primary,
                          ),
                    ),
                  ),
                  ProjectContextMenu(
                    onOpen: () => context.go("/project/${project.id}"),
                    onCopy: () {},
                    onInviteCreate: () {},
                    onDelete: () => showDialog(
                      context: context,
                      builder: (_) => DeleteProjectModal(
                        projectId: project.id,
                        projectName: project.name,
                      ),
                    ),
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
                  project.description.isEmpty
                      ? "Добавьте описание к проекту"
                      : project.description,
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
                children: [
                  ProjectTags(
                    text: "${project.users.length.toString()} участник",
                    type: const ProjectTagInfoType(),
                  ),
                  ProjectTags(
                    text: project.type.name(context),
                    type: const ProjectTagWarnType(),
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
