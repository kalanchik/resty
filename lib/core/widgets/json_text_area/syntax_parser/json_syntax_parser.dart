import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JsonSyntaxParser {
  static TextStyle baseStyle = GoogleFonts.firaCode(
    fontSize: 14,
    height: 1.5, // Уберите height или установите одинаковое значение
    letterSpacing: 0.0,
    color: Colors.white,
  );

  TextSpan highlight(String text) {
    final List<TextSpan> spans = [];
    final pattern = RegExp(
      r'(?<key>"[^"]*"\s*:)|(?<string>"[^"]*")|(?<number>\b\d+\.?\d*\b)|(?<bool>\btrue\b|\bfalse\b)|(?<null>\bnull\b)|(?<punct>[{}\[\],:])',
    );

    int lastEnd = 0;
    for (final match in pattern.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: baseStyle,
        ));
      }

      TextStyle style = baseStyle;
      if (match.namedGroup('key') != null) {
        style = style.copyWith(color: Colors.blue);
      } else if (match.namedGroup('string') != null) {
        style = style.copyWith(color: Colors.green);
      } else if (match.namedGroup('number') != null) {
        style = style.copyWith(color: Colors.orange);
      } else if (match.namedGroup('bool') != null) {
        style = style.copyWith(color: Colors.purple);
      } else if (match.namedGroup('null') != null) {
        style = style.copyWith(color: Colors.grey);
      } else if (match.namedGroup('punct') != null) {
        style = style.copyWith(color: Colors.white);
      }

      spans.add(TextSpan(
        text: match.group(0),
        style: style,
      ));

      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: baseStyle,
      ));
    }

    return TextSpan(children: spans);
  }
}
