import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnNumbersBuilder extends StatelessWidget {
  const ColumnNumbersBuilder({
    super.key,
    this.width = 40,
    this.padding,
    this.style,
    required this.controller,
    required this.count,
  });

  final double width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final ScrollController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.only(right: 8),
      child: SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List<Widget>.generate(
            count,
            (index) => Text(
              "${index + 1}",
              style: style ??
                  GoogleFonts.firaCode(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.5,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
