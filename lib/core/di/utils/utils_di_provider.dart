import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/collection_path_indexer.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/path_indexer.dart';
import 'package:postmanovich/domain/entity/logger/logger_factory.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UtilsDiProvider extends StatelessWidget {
  const UtilsDiProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (_) => Dio()),
        RepositoryProvider<Talker>(
          create: (context) => LoggerFactory.create(
            context.read<Dio>(),
          ),
          lazy: false,
        ),
        RepositoryProvider<CollectionPathIndexer>(
          create: (context) => CollectionPathIndexer(
            indexer: PathIndexer(),
          ),
        ),
      ],
      child: child,
    );
  }
}
