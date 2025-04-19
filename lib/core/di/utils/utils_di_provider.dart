import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UtilsDiProvider extends StatelessWidget {
  const UtilsDiProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (_) => Dio()),
      ],
      child: child,
    );
  }
}
