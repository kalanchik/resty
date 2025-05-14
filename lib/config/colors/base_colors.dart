import 'dart:ui';

import 'package:equatable/equatable.dart';

class BaseColors extends Equatable {
  final Color background;
  final Color layer;
  final Color layerHover;
  final Color layerBorder;
  final Color layerAccent;
  final Color dropdown;
  final Color hover;
  final Color tooltip;
  final Color brand;
  final Color brandHover;
  final Color brandActive;
  final Color focus;
  final Color brandLight;
  final Color brandMedium;
  final Color info;
  final Color positive;
  final Color positiveHover;
  final Color positiveActive;
  final Color warn;
  final Color warnHover;
  final Color warnActive;
  final Color danger;
  final Color dangerHover;
  final Color dangerActive;
  final Color infoLight;
  final Color positiveLight;
  final Color warnLight;
  final Color dangerLight;
  final Color infoMedium;
  final Color positiveMedium;
  final Color warnMedium;
  final Color dangerMedium;
  final Color shadow;

  const BaseColors({
    required this.background,
    required this.layer,
    required this.layerHover,
    required this.layerBorder,
    required this.layerAccent,
    required this.dropdown,
    required this.hover,
    required this.tooltip,
    required this.brand,
    required this.brandHover,
    required this.brandActive,
    required this.focus,
    required this.brandLight,
    required this.brandMedium,
    required this.info,
    required this.positive,
    required this.positiveHover,
    required this.positiveActive,
    required this.warn,
    required this.warnHover,
    required this.warnActive,
    required this.danger,
    required this.dangerHover,
    required this.dangerActive,
    required this.infoLight,
    required this.positiveLight,
    required this.warnLight,
    required this.dangerLight,
    required this.infoMedium,
    required this.positiveMedium,
    required this.warnMedium,
    required this.dangerMedium,
    required this.shadow,
  });

  factory BaseColors.light() => BaseColors(
        background: const Color(0xFFFFFFFF),
        layer: const Color(0xFFF8F8F9),
        layerHover: const Color(0xFFF4F4F6),
        layerBorder: const Color(0xFFE3E3E8),
        layerAccent: const Color(0xFFEEEEF1),
        dropdown: const Color(0xFFFFFFFF),
        hover: const Color(0xFFE3E3E8),
        tooltip: const Color(0xFFFFFFFF),
        brand: const Color(0xFFCC6FFF),
        brandHover: const Color(0xFF776EF2),
        brandActive: const Color(0xFF4F44EE),
        focus: const Color(0xFFABA6ED),
        brandLight: const Color(0xFF554AE2).withValues(alpha: .2),
        brandMedium: const Color(0xFF554AE2).withValues(alpha: .2),
        info: const Color(0xFF0A7AFF),
        positive: const Color(0xFF12B76A),
        positiveHover: const Color(0xFF32D583),
        positiveActive: const Color(0xFF6CE9A6),
        warn: const Color(0xFFF0A72F),
        warnHover: const Color(0xFFEBB069),
        warnActive: const Color(0xFFE9A451),
        danger: const Color(0xFFFF5C5C),
        dangerHover: const Color(0xFFE56B6B),
        dangerActive: const Color(0xFFE95F5F),
        infoLight: const Color(0xFF0A7AFF).withValues(alpha: .2),
        positiveLight: const Color(0xFF0DC268).withValues(alpha: .2),
        warnLight: const Color(0xFFF0A72F).withValues(alpha: .2),
        dangerLight: const Color(0xFFFF5C5C).withValues(alpha: .2),
        infoMedium: const Color(0xFF0A7AFF).withValues(alpha: .3),
        positiveMedium: const Color(0xFF0DC268).withValues(alpha: .3),
        warnMedium: const Color(0xFFF0A72F).withValues(alpha: .3),
        dangerMedium: const Color(0xFFFF5C5C).withValues(alpha: .3),
        shadow: const Color(0xFF1F1F23).withValues(alpha: .1),
      );

  factory BaseColors.dark() => BaseColors(
        background: const Color(0xFF151518),
        layer: const Color(0xFF1F1F23),
        layerHover: const Color(0xFF25252D),
        layerBorder: const Color(0xFF2A2A35),
        layerAccent: const Color(0xFF2A2A35),
        dropdown: const Color(0xFF25252D),
        hover: const Color(0xFF31313F),
        tooltip: const Color(0xFF32313A),
        brand: const Color(0xFFCC6FFF),
        brandHover: const Color(0xFF776EF2),
        brandActive: const Color(0xFFA8A3F0),
        focus: const Color(0xFFABA6ED),
        brandLight: const Color(0xFF554AE2).withValues(alpha: .2),
        brandMedium: const Color(0xFF554AE2).withValues(alpha: .2),
        info: const Color(0xFF0A7AFF),
        positive: const Color(0xFF12B76A),
        positiveHover: const Color(0xFF32D583),
        positiveActive: const Color(0xFF6CE9A6),
        warn: const Color(0xFFF0A72F),
        warnHover: const Color(0xFFEBB069),
        warnActive: const Color(0xFFE9A451),
        danger: const Color(0xFFFF5C5C),
        dangerHover: const Color(0xFFE56B6B),
        dangerActive: const Color(0xFFE95F5F),
        infoLight: const Color(0xFF0A7AFF).withValues(alpha: .2),
        positiveLight: const Color(0xFF0DC268).withValues(alpha: .2),
        warnLight: const Color(0xFFF0A72F).withValues(alpha: .2),
        dangerLight: const Color(0xFFFF5C5C).withValues(alpha: .2),
        infoMedium: const Color(0xFF0A7AFF).withValues(alpha: .3),
        positiveMedium: const Color(0xFF0DC268).withValues(alpha: .3),
        warnMedium: const Color(0xFFF0A72F).withValues(alpha: .3),
        dangerMedium: const Color(0xFFFF5C5C).withValues(alpha: .3),
        shadow: const Color(0xFF1F1F23).withValues(alpha: .1),
      );

  @override
  List<Object?> get props => [
        background,
        layer,
        layerHover,
        layerBorder,
        layerAccent,
        dropdown,
        hover,
        tooltip,
        brand,
        brandHover,
        brandActive,
        focus,
        brandLight,
        brandMedium,
        info,
        positive,
        positiveHover,
        positiveActive,
        warn,
        warnHover,
        warnActive,
        danger,
        dangerHover,
        dangerActive,
        infoLight,
        positiveLight,
        warnLight,
        dangerLight,
        infoMedium,
        positiveMedium,
        warnMedium,
        dangerMedium,
        shadow,
      ];
}
