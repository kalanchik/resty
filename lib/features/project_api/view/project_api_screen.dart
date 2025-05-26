import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/features/project_api/widget/project_api_collections/view/project_api_collections.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/factory/collection_tree_bloc_factory.dart';

class ProjectApiScreen extends StatefulWidget {
  const ProjectApiScreen({super.key});

  @override
  State<ProjectApiScreen> createState() => _ProjectApiScreenState();
}

class _ProjectApiScreenState extends State<ProjectApiScreen> {
  late final TextEditingController _searchItemsController;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(
      AppNumbers.of(context).brRadius.m,
    ));

    final boxBorder = Border.all(color: AppColors.of(context).input.border);

    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionTreeBloc>(
          create: (context) => CollectionTreeBlocFactory.create(context),
        ),
      ],
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.of(context).bs.layer,
            borderRadius: borderRadius,
            border: boxBorder,
          ),
          child: Row(
            children: [
              ProjectApiCollections(
                searchController: _searchItemsController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _searchItemsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchItemsController.dispose();
    super.dispose();
  }
}
