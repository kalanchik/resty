import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class IconColors extends Equatable {
  final Color primary;
  final Color secondary;
  final Color ghost;
  final Color disabled;
  final Color lightPrimary;
  final Color lightSecondary;
  final Color lightGhost;
  final Color info;
  final Color positive;
  final Color warn;
  final Color danger;
  final Color brand;

  const IconColors({
    required this.primary,
    required this.secondary,
    required this.ghost,
    required this.disabled,
    required this.lightPrimary,
    required this.lightSecondary,
    required this.lightGhost,
    required this.info,
    required this.positive,
    required this.warn,
    required this.danger,
    required this.brand,
  });

  factory IconColors.light() => const IconColors(
        primary: Color(0xFF222026),
        secondary: Color(0xFF585760),
        ghost: Color(0xFF85848C),
        disabled: Color(0xFFD2D2D5),
        lightPrimary: Color(0xFFEBEBED),
        lightSecondary: Color(0xFFA6A8AE),
        lightGhost: Color(0xFF6E6E7A),
        info: Color(0xFF0A7AFF),
        positive: Color(0xFF039855),
        warn: Color(0xFFF0A72F),
        danger: Color(0xFFFF5C5C),
        brand: Color(0xFFF77CFF),
      );

  factory IconColors.dark() => const IconColors(
        primary: Color(0xFFEBEBED),
        secondary: Color(0xFFA6A8AE),
        ghost: Color(0xFF6E6E7A),
        disabled: Color(0xFF3A3A3F),
        lightPrimary: Color(0xFFEBEBED),
        lightSecondary: Color(0xFFA6A8AE),
        lightGhost: Color(0xFF6E6E7A),
        info: Color(0xFF0A7AFF),
        positive: Color(0xFF039855),
        warn: Color(0xFFF0A72F),
        danger: Color(0xFFFF5C5C),
        brand: Color(0xFFF77CFF),
      );

  @override
  List<Object?> get props => [
        primary,
        secondary,
        ghost,
        disabled,
        lightPrimary,
        lightSecondary,
        lightGhost,
        info,
        positive,
        warn,
        danger,
        brand,
      ];
}
