part of 'collection_tree_bloc.dart';

sealed class CollectionTreeState extends Equatable {
  const CollectionTreeState();
}

final class CollectionTreeInitial extends CollectionTreeState {
  @override
  List<Object?> get props => [];
}

final class CollectionTreeLoaded extends CollectionTreeState {
  const CollectionTreeLoaded({
    required this.root,
  });

  final Folder root;

  @override
  List<Object?> get props => [root];
}


