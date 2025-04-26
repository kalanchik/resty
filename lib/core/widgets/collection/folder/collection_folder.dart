import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/widgets/collection/folder/bloc/folder_rename_bloc.dart';
import 'package:postmanovich/core/widgets/collection/folder/folder_context_menu.dart';
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
                    onTap: () => _changeExpression(
                      context,
                      isExpanded: !folder.isExpanded,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    child: Row(
                      spacing: 6.0,
                      children: [
                        AnimatedRotation(
                          turns: folder.isExpanded ? .5 : 0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastEaseInToSlowEaseOut,
                          child: const Icon(
                            Icons.expand_more,
                          ),
                        ),
                        Row(
                          spacing: 4.0,
                          children: [
                            const Icon(
                              Icons.folder,
                            ),
                            BlocBuilder<FolderRenameBloc, FolderRenameState>(
                              bloc: context.read<FolderRenameBloc>(),
                              builder: (context, state) {
                                if (state is FolderRanaming) {
                                  return SizedBox(
                                    width: 150,
                                    child: TextFormField(
                                      autofocus: true,
                                      onTapOutside: (event) => context
                                          .read<FolderRenameBloc>()
                                          .add(StopFolderRenameEvent()),
                                      onFieldSubmitted: (value) {
                                        if (value.isEmpty) {
                                          return;
                                        }

                                        context
                                            .read<FolderRenameBloc>()
                                            .add(CompleteFolderRenameEvent(
                                              newName: value,
                                            ));
                                      },
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                      ),
                                      initialValue: folder.name,
                                    ),
                                  );
                                }
                                return Text(
                                  folder.name,
                                );
                              },
                            ),
                          ],
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
