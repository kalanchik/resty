import 'package:postmanovich/core/error/app_error.dart';

typedef UseCaseResp<T, R extends AppError> = ({T? data, R? error});
