import 'dart:ui';

import 'package:equatable/equatable.dart';

class ButtonColors extends Equatable {
  const ButtonColors({
    required this.ghost,
    required this.ghostHover,
    required this.ghostActive,
    required this.disabled,
    required this.positive,
    required this.positiveMedium,
    required this.positiveLight,
    required this.positiveHover,
    required this.positiveActive,
    required this.danger,
    required this.dangerMedium,
    required this.dangerLight,
    required this.dangerHover,
    required this.dangerActive,
    required this.warn,
    required this.warnMedium,
    required this.warnLight,
    required this.warnHover,
    required this.warnActive,
    required this.brand,
    required this.brandHover,
    required this.brandActive,
    required this.brandLight,
    required this.brandMedium,
    required this.brandText,
  });

  final Color ghost;
  final Color ghostHover;
  final Color ghostActive;
  final Color disabled;
  final Color positive;
  final Color positiveMedium;
  final Color positiveLight;
  final Color positiveHover;
  final Color positiveActive;
  final Color danger;
  final Color dangerMedium;
  final Color dangerLight;
  final Color dangerHover;
  final Color dangerActive;
  final Color warn;
  final Color warnMedium;
  final Color warnLight;
  final Color warnHover;
  final Color warnActive;
  final Color brand;
  final Color brandHover;
  final Color brandActive;
  final Color brandLight;
  final Color brandMedium;
  final Color brandText;

  factory ButtonColors.light() => ButtonColors(
        ghost: const Color(0xFF4E4D5B),
        ghostHover: const Color(0xFF6B697D),
        ghostActive: const Color(0xFF8A889B),
        disabled: const Color(0xFF4E4D5B),
        positive: const Color(0xFF039855),
        positiveMedium: const Color(0xFF0DC268).withValues(alpha: .3),
        positiveLight: const Color(0xFF0DC268).withValues(alpha: .2),
        positiveHover: const Color(0xFF12B76A),
        positiveActive: const Color(0xFF32D583),
        danger: const Color(0xFFFF5C5C),
        dangerMedium: const Color(0xFFFF5C5C).withValues(alpha: .3),
        dangerLight: const Color(0xFFFF5C5C).withValues(alpha: .2),
        dangerHover: const Color(0xFFE56B6B),
        dangerActive: const Color(0xFFE95F5F),
        warn: const Color(0xFFF0A72F),
        warnMedium: const Color(0xFFF0A72F).withValues(alpha: .3),
        warnLight: const Color(0xFFF0A72F).withValues(alpha: .2),
        warnHover: const Color(0xFFD69E5C),
        warnActive: const Color(0xFFE9A451),
        brand: const Color(0xFFCC6FFF),
        brandHover: const Color(0xFFCC6FFF),
        brandActive: const Color(0xFFCC6FFF),
        brandLight: const Color(0xFFCC6FFF),
        brandMedium: const Color(0xFFCC6FFF),
        brandText: const Color(0xFFEBEBED),
      );

  factory ButtonColors.dark() => ButtonColors(
        ghost: const Color(0xFF25252D),
        ghostHover: const Color(0xFF31313F),
        ghostActive: const Color(0xFF2A2A35),
        disabled: const Color(0xFF25252D),
        positive: const Color(0xFF039855),
        positiveMedium: const Color(0xFF0DC268).withValues(alpha: .3),
        positiveLight: const Color(0xFF0DC268).withValues(alpha: .2),
        positiveHover: const Color(0xFF12B76A),
        positiveActive: const Color(0xFF32D583),
        danger: const Color(0xFFFF5C5C),
        dangerMedium: const Color(0xFFFF5C5C).withValues(alpha: .3),
        dangerLight: const Color(0xFFFF5C5C).withValues(alpha: .2),
        dangerHover: const Color(0xFFE56B6B),
        dangerActive: const Color(0xFFE95F5F),
        warn: const Color(0xFFF0A72F),
        warnMedium: const Color(0xFFF0A72F).withValues(alpha: .3),
        warnLight: const Color(0xFFF0A72F).withValues(alpha: .2),
        warnHover: const Color(0xFFD69E5C),
        warnActive: const Color(0xFFE9A451),
        brand: const Color(0xFFCC6FFF),
        brandHover: const Color(0xFFCC6FFF),
        brandActive: const Color(0xFFCC6FFF),
        brandLight: const Color(0xFFCC6FFF),
        brandMedium: const Color(0xFFCC6FFF),
        brandText: const Color(0xFFEBEBED),
      );

  @override
  List<Object?> get props => [
        ghost,
        ghostHover,
        ghostActive,
        disabled,
        positive,
        positiveMedium,
        positiveLight,
        positiveHover,
        positiveActive,
        danger,
        dangerMedium,
        dangerLight,
        dangerHover,
        dangerActive,
        warn,
        warnMedium,
        warnLight,
        warnHover,
        warnActive,
        brand,
        brandHover,
        brandActive,
        brandLight,
        brandMedium,
        brandText
      ];
}
