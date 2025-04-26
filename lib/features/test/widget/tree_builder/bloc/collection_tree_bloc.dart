import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/config/constants/globals.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/collection_path_indexer.dart';
import 'package:postmanovich/domain/use_case/tree_use_case/tree_use_case.dart';
import 'package:uuid/uuid.dart';

part 'collection_tree_event.dart';
part 'collection_tree_state.dart';

class CollectionTreeBloc
    extends Bloc<CollectionTreeEvent, CollectionTreeState> {
  final TreeUseCase _treeUseCase;
  final CollectionPathIndexer _indexer;
  static const Uuid uuid = Uuid();

  CollectionTreeBloc(this._treeUseCase, this._indexer)
      : super(CollectionTreeInitial()) {
    on<InitRootEvent>((event, emit) {
      const root = Globals.testRoot;

      add(const BuildRootEvent(root));
    });
    on<ChangeFolderExpandEvent>((event, emit) async {
      final currentState = state;

      if (currentState is! CollectionTreeLoaded) return;

      final newRoot = await _treeUseCase.toggleExpasion(
        root: currentState.root,
        folderId: event.folderId,
        isExpanded: event.isExpanded,
      );

      add(BuildRootEvent(newRoot));
    });
    on<AddFolderEvent>((event, emit) async {
      final currentState = state;

      if (currentState is! CollectionTreeLoaded) return;

      final newRoot = await _treeUseCase.addEntityToPath(
        root: currentState.root,
        entity: Folder.empty(uuid.v4()),
        folderId: event.folderId,
      );

      add(BuildRootEvent(newRoot));
    });
    on<AddRequestEvent>((event, emit) async {
      final currentState = state;

      if (currentState is! CollectionTreeLoaded) return;

      final newRoot = await _treeUseCase.addEntityToPath(
        entity: RequestItem.empty(uuid.v4()),
        root: currentState.root,
        folderId: event.folderId,
      );

      add(BuildRootEvent(newRoot));
    });
    on<DeleteEntityEvent>((event, emit) async {
      final currentState = state;

      if (currentState is! CollectionTreeLoaded) return;

      final newRoot = await _treeUseCase.deleteEntity(
        root: currentState.root,
        entityId: event.entityId,
      );

      add(BuildRootEvent(newRoot));
    });
    on<RenameEntityEvent>((event, emit) async {
      final currentState = state;

      if (currentState is! CollectionTreeLoaded) return;

      final newRoot = await _treeUseCase.renameEntity(
        root: currentState.root,
        entityId: event.entityId,
        name: event.newName,
      );

      add(BuildRootEvent(newRoot));
    });
    on<BuildRootEvent>((event, emit) async {
      emit(CollectionTreeInitial());

      _indexer.reindex(event.newRoot);

      emit(CollectionTreeLoaded(root: event.newRoot));
    });
  }
}
