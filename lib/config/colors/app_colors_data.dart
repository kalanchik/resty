import 'package:equatable/equatable.dart';
import 'package:postmanovich/config/colors/base_colors.dart';
import 'package:postmanovich/config/colors/button_colors.dart';
import 'package:postmanovich/config/colors/icon_colors.dart';
import 'package:postmanovich/config/colors/input_colors.dart';
import 'package:postmanovich/config/colors/tab_colors.dart';
import 'package:postmanovich/config/colors/text_colors.dart';

class AppColorsData extends Equatable {
  final bool isDarkMode;

  // BASE
  final BaseColors bs;

  // TEXT
  final TextColors text;

  // ICONS
  final IconColors icons;

  // BUTTON
  final ButtonColors button;

  // INPUT
  final InputColors input;

  // TAB
  final TabColors tab;

  const AppColorsData({
    required this.isDarkMode,
    required this.bs,
    required this.text,
    required this.icons,
    required this.button,
    required this.input,
    required this.tab,
  });

  factory AppColorsData.light() => AppColorsData(
        isDarkMode: false,
        bs: BaseColors.light(),
        text: TextColors.light(),
        icons: IconColors.light(),
        button: ButtonColors.light(),
        input: InputColors.light(),
        tab: TabColors.light(),
      );

  factory AppColorsData.dark() => AppColorsData(
        isDarkMode: true,
        bs: BaseColors.dark(),
        text: TextColors.dark(),
        icons: IconColors.dark(),
        button: ButtonColors.dark(),
        input: InputColors.dark(),
        tab: TabColors.dark(),
      );

  @override
  List<Object?> get props => [isDarkMode, bs, text, icons, button, input, tab];
}
