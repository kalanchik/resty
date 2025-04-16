import 'package:equatable/equatable.dart';

abstract class RequestMethod extends Equatable {
  String toCurl();

  const RequestMethod();
}
