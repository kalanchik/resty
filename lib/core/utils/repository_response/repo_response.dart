import 'package:equatable/equatable.dart';

class RepoResponse<R> extends Equatable {
  const RepoResponse(this.data);

  final R data;

  @override
  List<Object?> get props => [data];
}
