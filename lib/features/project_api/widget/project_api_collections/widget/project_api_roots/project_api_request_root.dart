import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/collection/folder_tree_builder.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';

class ProjectApiRequestRoot extends StatelessWidget {
  const ProjectApiRequestRoot({
    super.key,
    required this.root,
  });

  final Folder root;

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x1,
      vertical: AppNumbers.of(context).spacings.x1_5,
    );

    final brRadius = BorderRadius.all(Radius.circular(
      AppNumbers.of(context).brRadius.xs,
    ));

    final textStyle = AppTextStyle.of(context).textFootnote.copyWith(
          color: AppColors.of(context).text.secondary,
        );

    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          InkWell(
            onTap: null,
            borderRadius: brRadius,
            hoverColor: AppColors.of(context).bs.hover,
            splashFactory: NoSplash.splashFactory,
            child: Padding(
              padding: contentPadding,
              child: Row(
                spacing: AppNumbers.of(context).spacings.x2,
                children: [
                  InkWell(
                    onTap: () => context
                        .read<CollectionTreeBloc>()
                        .add(ChangeFolderExpandEvent(
                          folderId: root.id,
                          isExpanded: !root.isExpanded,
                        )),
                    child: AnimatedRotation(
                      turns: root.isExpanded ? .5 : 0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      child: AppIcon(
                        icon: AppAssets.of(context).arrowAngleDown,
                        size: 12,
                        color: AppColors.of(context).icons.secondary,
                      ),
                    ),
                  ),
                  AppIcon(
                    icon: AppAssets.of(context).request,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Запросы",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.fastEaseInToSlowEaseOut,
            switchOutCurve: Curves.fastEaseInToSlowEaseOut,
            transitionBuilder: (child, animation) => SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
            child: root.isExpanded && root.children.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: FolderTreeBuilder(
                      children: root.children,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
