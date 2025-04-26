import 'package:flutter/material.dart';
import 'package:postmanovich/core/widgets/collection/folder/collection_folder.dart';
import 'package:postmanovich/core/widgets/collection/request/collection_request.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';

class WorkspaceEntityBuilder extends StatelessWidget {
  const WorkspaceEntityBuilder({
    super.key,
    required this.entities,
  });

  final List<CollectionEntity> entities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: entities.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final item = entities[index];

          return switch (item) {
            Folder() => CollectionFolder(folder: item),
            RequestItem() => CollectionRequest(request: item),
          };
        },
      ),
    );
  }
}
