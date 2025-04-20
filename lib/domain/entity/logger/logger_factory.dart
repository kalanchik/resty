import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LoggerFactory {
  const LoggerFactory._();

  static Talker create(Dio dio) {
    final Talker logger = TalkerFlutter.init(
      settings: TalkerSettings(
        useHistory: false,
        maxHistoryItems: 100,
      ),
    );

    Bloc.observer = TalkerBlocObserver(talker: logger);

    dio.interceptors.add(
      TalkerDioLogger(
        talker: logger,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
        ),
      ),
    );

    return logger;
  }
}
