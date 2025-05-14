import 'package:postmanovich/config/numbers/border_radius.dart';
import 'package:postmanovich/config/numbers/spacings_data.dart';

class AppNumbersData {
  const AppNumbersData();

  // BREAKPOINTS

  int get mobileBreak => 375;
  int get tabletBreak => 768;
  int get desktopBreak => 1024;

  // BUTTONS HEIGHT

  int get buttonXS => 24;
  int get buttonS => 32;
  int get buttonM => 36;
  int get buttonL => 40;
  int get buttonXL => 48;

  BorderRadiusData get brRadius => const BorderRadiusData();
  SpacingsData get spacings => const SpacingsData();
}
