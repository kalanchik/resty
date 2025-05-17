import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    this.width = 16,
    this.height = 16,
    this.colorFilter,
    this.fit = BoxFit.cover,
  });

  final double width;
  final double height;
  final String icon;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        icon,
        colorFilter: colorFilter,
        fit: fit,
      ),
    );
  }
}
