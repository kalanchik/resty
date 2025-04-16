import 'package:equatable/equatable.dart';

abstract class CurlBody extends Equatable {
  const CurlBody();

  dynamic get data;

  String toView();
}
