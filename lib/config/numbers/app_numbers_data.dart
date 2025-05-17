import 'package:postmanovich/config/numbers/border_radius.dart';
import 'package:postmanovich/config/numbers/spacings_data.dart';

class AppNumbersData {
  const AppNumbersData();

  // BREAKPOINTS

  double get mobileBreak => 375;
  double get tabletBreak => 768;
  double get desktopBreak => 1024;

  // BUTTONS HEIGHT

  double get buttonXS => 24;
  double get buttonS => 32;
  double get buttonM => 36;
  double get buttonL => 40;
  double get buttonXL => 48;

  BorderRadiusData get brRadius => const BorderRadiusData();
  SpacingsData get spacings => const SpacingsData();
}
