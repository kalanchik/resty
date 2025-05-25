import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/widgets/context_menu/view/app_context_menu.dart';
import 'package:postmanovich/core/widgets/context_menu/view/app_context_menu_toolbar.dart';
import 'package:postmanovich/core/widgets/context_menu/widget/context_menu_item/context_menu_item.dart';
import 'package:postmanovich/core/widgets/context_menu/widget/context_menu_item/context_menu_item_type.dart';
import 'package:postmanovich/core/widgets/naitive_context_menu/context_menu_region.dart';

class ProjectContextMenu extends StatelessWidget {
  const ProjectContextMenu({
    super.key,
    required this.onOpen,
    required this.onCopy,
    required this.onInviteCreate,
    required this.onDelete,
    required this.child,
  });

  final VoidCallback onOpen;
  final VoidCallback onCopy;
  final VoidCallback onInviteCreate;
  final VoidCallback onDelete;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      enableLeftClick: true,
      contextMenuBuilder: (context, offest) {
        return AppContextMenuToolbar(
          offset: offest,
          child: AppContextMenu(
            mainGroup: [
              ContextMenuItem(
                onTap: () {
                  ContextMenuController.removeAny();
                  onOpen();
                },
                text: "Открыть",
              ),
              ContextMenuItem(
                text: "Создать копию",
                iconPath: AppAssets.of(context).copy,
                onTap: () {
                  ContextMenuController.removeAny();
                  onCopy();
                },
              ),
              ContextMenuItem(
                text: "Создать приглашение",
                iconPath: AppAssets.of(context).userAdd,
                onTap: () {
                  ContextMenuController.removeAny();
                  onInviteCreate();
                },
              ),
            ],
            secondaryGroup: [
              ContextMenuItem(
                text: "Удалить",
                iconPath: AppAssets.of(context).trash,
                type: ContextMenuItemTypeDanger(),
                onTap: () {
                  ContextMenuController.removeAny();
                  onDelete();
                },
              ),
            ],
          ),
        );
      },
      child: child,
    );
  }
}
