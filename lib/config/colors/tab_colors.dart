import 'dart:ui';

import 'package:equatable/equatable.dart';

class TabColors extends Equatable {
  final Color active;
  final Color counter;
  final Color counterActive;
  final Color fill;
  final Color activeDanger;

  const TabColors({
    required this.active,
    required this.counter,
    required this.counterActive,
    required this.fill,
    required this.activeDanger,
  });

  factory TabColors.dark() => const TabColors(
        active: Color(0xFF32313A),
        counter: Color(0xFF32313A),
        counterActive: Color(0xFF4E4D5B),
        fill: Color(0xFF1F1F23),
        activeDanger: Color(0xFFCE5565),
      );

  factory TabColors.light() => const TabColors(
        active: Color(0xFFFFFFFF),
        counter: Color(0xFF4E4D5B),
        counterActive: Color(0xFF32313A),
        fill: Color(0xFFF0F0F0),
        activeDanger: Color(0xFFF17989),
      );

  @override
  List<Object?> get props => [
        active,
        counter,
        counterActive,
        fill,
        activeDanger,
      ];
}
