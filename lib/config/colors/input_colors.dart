import 'dart:ui';

import 'package:equatable/equatable.dart';

class InputColors extends Equatable {
  final Color fill;
  final Color fillLayer;
  final Color border;
  final Color borderBrand;
  final Color disabled;
  final Color disabledLayer;

  const InputColors({
    required this.fill,
    required this.fillLayer,
    required this.border,
    required this.borderBrand,
    required this.disabled,
    required this.disabledLayer,
  });

  factory InputColors.dark() => const InputColors(
        fill: Color(0xFF1F1F23),
        fillLayer: Color(0xFF151518),
        border: Color(0xFF32313A),
        borderBrand: Color(0xFFCC6FFF),
        disabled: Color(0xFF202024),
        disabledLayer: Color(0xFF202024),
      );

  factory InputColors.light() => const InputColors(
        fill: Color(0xFF1F1F23),
        fillLayer: Color(0xFFEEEEF1),
        border: Color(0xFF6B697D),
        borderBrand: Color(0xFFCC6FFF),
        disabled: Color(0xFFF4F4F6),
        disabledLayer: Color(0xFFF8F8F9),
      );

  @override
  List<Object?> get props => [
        fill,
        fillLayer,
        border,
        borderBrand,
        disabled,
        disabledLayer,
      ];
}
