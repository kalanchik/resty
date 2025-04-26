import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/naitive_context_menu/context_menu_region.dart';

class FolderContextMenu extends StatelessWidget {
  const FolderContextMenu({
    super.key,
    required this.onExpressionChanged,
    required this.onAddFolder,
    required this.onAddRequest,
    required this.onFolderDelete,
    required this.onFolderRename,
    required this.isExpanded,
    required this.child,
  });

  final ValueChanged<bool> onExpressionChanged;
  final VoidCallback onAddFolder;
  final VoidCallback onAddRequest;
  final VoidCallback onFolderDelete;
  final VoidCallback onFolderRename;
  final bool isExpanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      contextMenuBuilder: (context, offset) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
          buttonItems: <ContextMenuButtonItem>[
            ContextMenuButtonItem(
              onPressed: () {
                ContextMenuController.removeAny();
                onExpressionChanged(!isExpanded);
              },
              label: isExpanded ? 'Свернуть' : 'Развернуть',
            ),
            ContextMenuButtonItem(
              onPressed: () {
                ContextMenuController.removeAny();
                onFolderRename();
              },
              label: "Переименовать",
            ),
            ContextMenuButtonItem(
              type: ContextMenuButtonType.paste,
              onPressed: () {
                ContextMenuController.removeAny();
              },
              label: 'Копировать',
            ),
            ContextMenuButtonItem(
              onPressed: () {
                ContextMenuController.removeAny();
                onFolderDelete();
              },
              label: 'Удалить папку',
            ),
            ContextMenuButtonItem(
              onPressed: () {
                ContextMenuController.removeAny();
                onAddFolder();
              },
              label: 'Добавить папку',
            ),
            ContextMenuButtonItem(
              onPressed: () {
                ContextMenuController.removeAny();
                onAddRequest();
              },
              label: 'Добавить запрос',
            ),
          ],
        );
      },
      child: child,
    );
  }
}
