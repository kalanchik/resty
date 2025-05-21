import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/data/repository/request_repository_impl.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/collection_path_indexer.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case_factory.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case_impl.dart';
import 'package:postmanovich/domain/use_case/tree_use_case/tree_use_case.dart';
import 'package:postmanovich/domain/use_case/tree_use_case/tree_use_case_impl.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case_factory.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UseCaseProvider extends StatelessWidget {
  const UseCaseProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Dio dio = context.read<Dio>();
    final Talker logger = context.read<Talker>();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RequestUseCase>(
          create: (context) => RequestUseCaseImpl(
            RequestRepositoryImpl(dio),
          ),
        ),
        RepositoryProvider<TreeUseCase>(
          create: (context) => TreeUseCaseImpl(
            indexer: context.read<CollectionPathIndexer>(),
            logger: logger,
          ),
        ),
        RepositoryProvider<UserUseCase>(
          create: (context) => UserUseCaseFactory.create(logger),
        ),
        RepositoryProvider<ProjectUseCase>(
          create: (context) => ProjectUseCaseFactory.create(context),
        ),
      ],
      child: child,
    );
  }
}
