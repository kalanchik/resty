import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';

class FolderDragTarget extends StatelessWidget {
  const FolderDragTarget({
    super.key,
    required this.folder,
    required this.child,
  });

  final Folder folder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DragTarget<Folder>(
      builder: (context, candidateData, rejectedData) {
        return child;
      },
      onAcceptWithDetails: (details) {
        context.read<CollectionTreeBloc>().add(DragEntityEvent(
              entityId: details.data.id,
              folderId: folder.id,
            ));
      },
    );
  }
}
