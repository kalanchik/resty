import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/collection/request/collection_request.dart';
import 'package:postmanovich/core/widgets/collection/folder/collection_folder.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';

class FolderTreeBuilder extends StatelessWidget {
  const FolderTreeBuilder({
    super.key,
    required this.children,
  });

  final List<CollectionEntity> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: children.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final item = children[index];

          return switch (item) {
            Folder() => CollectionFolder(folder: item),
            RequestItem() => CollectionRequest(request: item),
          };
        },
      ),
    );
  }
}
