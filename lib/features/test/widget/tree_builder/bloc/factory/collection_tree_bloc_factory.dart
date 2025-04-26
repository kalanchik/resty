import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/collection_path_indexer.dart';
import 'package:postmanovich/domain/use_case/tree_use_case/tree_use_case.dart';
import 'package:postmanovich/features/test/widget/tree_builder/bloc/collection_tree_bloc.dart';

class CollectionTreeBlocFactory {
  const CollectionTreeBlocFactory._();

  static CollectionTreeBloc create(BuildContext context) {
    return CollectionTreeBloc(
      context.read<TreeUseCase>(),
      context.read<CollectionPathIndexer>(),
    )..add(const InitRootEvent());
  }
}
