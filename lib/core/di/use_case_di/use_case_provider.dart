import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/data/repository/request_repository_impl.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case.dart';
import 'package:postmanovich/domain/use_case/request_use_case/request_use_case_impl.dart';

class UseCaseProvider extends StatelessWidget {
  const UseCaseProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Dio dio = context.read<Dio>();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RequestUseCase>(
          create: (context) => RequestUseCaseImpl(
            RequestRepositoryImpl(dio),
          ),
        ),
      ],
      child: child,
    );
  }
}
