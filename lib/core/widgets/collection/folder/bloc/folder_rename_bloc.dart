import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'folder_rename_event.dart';
part 'folder_rename_state.dart';

class FolderRenameBloc extends Bloc<FolderRenameEvent, FolderRenameState> {
  FolderRenameBloc() : super(FolderRenameInitial()) {
    on<StartFolderRenameEvent>((event, emit) {
      emit(FolderRanaming());
    });
    on<StopFolderRenameEvent>((event, emit) {
      emit(FolderRenameInitial());
    });
    on<CompleteFolderRenameEvent>((event, emit) {
      emit(FolderRenamed(event.newName));
    });
  }
}
