import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/collection/draggable_collection_entity/draggable_collection_entity.dart';
import 'package:postmanovich/core/widgets/collection/draggable_collection_entity/folder_drag_target.dart';
import 'package:postmanovich/core/widgets/collection/folder/bloc/folder_rename_bloc.dart';
import 'package:postmanovich/core/widgets/collection/folder/folder_context_menu.dart';
import 'package:postmanovich/core/widgets/collection/folder/folder_row_info.dart';
import 'package:postmanovich/core/widgets/collection/folder_tree_builder.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';

class CollectionFolder extends StatelessWidget {
  const CollectionFolder({
    super.key,
    required this.folder,
  });

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FolderRenameBloc(),
      child: Builder(
        builder: (context) {
          return _FolderListener(
            onNameChanged: (value) => _completeFolderRename(context, value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FolderContextMenu(
                  onExpressionChanged: (isExpanded) => _changeExpression(
                    context,
                    isExpanded: isExpanded,
                  ),
                  onAddFolder: () => _addFolder(context),
                  onAddRequest: () => _addRequest(context),
                  onFolderDelete: () => _deleteFolder(context),
                  onFolderRename: () => _startFolderRename(context),
                  isExpanded: folder.isExpanded,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    child: DraggableCollectionEntity(
                      entity: folder,
                      feedbackBuilder: (context) => DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            folder.name,
                          ),
                        ),
                      ),
                      childWhenDraggingBuilder: (context) => DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: FolderRowInfo(
                          name: folder.name,
                          isExpanded: folder.isExpanded,
                          changeExpression: () {},
                        ),
                      ),
                      child: FolderDragTarget(
                        folder: folder,
                        child: FolderRowInfo(
                          name: folder.name,
                          isExpanded: folder.isExpanded,
                          changeExpression: () => _changeExpression(
                            context,
                            isExpanded: !folder.isExpanded,
                          ),
                        ),
                      ),
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
                  child: folder.isExpanded && folder.children.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: FolderTreeBuilder(
                            children: folder.children,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _changeExpression(
    BuildContext context, {
    required bool isExpanded,
  }) {
    context.read<CollectionTreeBloc>().add(ChangeFolderExpandEvent(
          folderId: folder.id,
          isExpanded: isExpanded,
        ));
  }

  void _addFolder(BuildContext context) {
    context.read<CollectionTreeBloc>().add(AddFolderEvent(
          folder.id,
        ));
  }

  void _addRequest(BuildContext context) {
    context.read<CollectionTreeBloc>().add(AddRequestEvent(
          folder.id,
        ));
  }

  void _deleteFolder(BuildContext context) {
    context.read<CollectionTreeBloc>().add(
          DeleteEntityEvent(folder.id),
        );
  }

  void _startFolderRename(BuildContext context) {
    context.read<FolderRenameBloc>().add(StartFolderRenameEvent());
  }

  void _completeFolderRename(BuildContext context, String newName) {
    context.read<CollectionTreeBloc>().add(RenameEntityEvent(
          entityId: folder.id,
          newName: newName,
        ));
  }
}

class _FolderListener extends StatelessWidget {
  const _FolderListener({
    required this.onNameChanged,
    required this.child,
  });

  final ValueChanged<String> onNameChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FolderRenameBloc, FolderRenameState>(
      bloc: context.read<FolderRenameBloc>(),
      listener: (context, state) {
        if (state is FolderRenamed) {
          onNameChanged(state.newName);
          return;
        }
      },
      child: child,
    );
  }
}
