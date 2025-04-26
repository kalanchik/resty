import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';
import 'package:postmanovich/features/test/widget/tree_builder/workspace_entity_builder.dart';
import 'package:postmanovich/features/test/widget/tree_builder/workspace_header.dart';

class WorkspaceTreeBuilder extends StatelessWidget {
  const WorkspaceTreeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.black26,
            ),
          ),
        ),
        child: BlocBuilder<CollectionTreeBloc, CollectionTreeState>(
          bloc: context.read<CollectionTreeBloc>(),
          builder: (context, state) {
            if (state is CollectionTreeLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WorkspaceHeader(
                    workspaceName: state.root.name,
                    onNewEntity: () {},
                  ),
                  WorkspaceEntityBuilder(
                    entities: state.root.children,
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
