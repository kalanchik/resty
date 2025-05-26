import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/features/project_api/widget/project_api_collections/widget/project_api_collections_header.dart';
import 'package:postmanovich/features/project_api/widget/project_api_collections/widget/project_api_roots/project_api_request_root.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';

class ProjectApiCollections extends StatelessWidget {
  const ProjectApiCollections({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(
      horizontal: AppNumbers.of(context).spacings.x2,
      vertical: AppNumbers.of(context).spacings.x4,
    );

    final decoration = BoxDecoration(
        border: Border(
      right: BorderSide(
        color: AppColors.of(context).input.border,
      ),
    ));

    return SizedBox(
      width: 250,
      height: double.infinity,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: contentPadding,
          child: Column(
            spacing: AppNumbers.of(context).spacings.x3,
            children: [
              ProjectApiCollectionsHeader(
                projectName: "Resty API",
                controller: searchController,
              ),
              Expanded(
                child: ListView(
                  children: [
                    BlocBuilder<CollectionTreeBloc, CollectionTreeState>(
                      bloc: context.read<CollectionTreeBloc>(),
                      builder: (context, state) {
                        if (state is CollectionTreeLoaded) {
                          return ProjectApiRequestRoot(
                            root: state.root,
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
