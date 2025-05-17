import 'package:postmanovich/config/numbers/border_radius.dart';
import 'package:postmanovich/config/numbers/spacings_data.dart';

class AppNumbersData {
  const AppNumbersData();

  // BREAKPOINTS

  /// 375
  double get mobileBreak => 375;

  /// 768
  double get tabletBreak => 768;

  /// 1024
  double get desktopBreak => 1024;

  // BUTTONS HEIGHT

  /// 24
  double get buttonXS => 24;

  /// 32
  double get buttonS => 32;

  /// 36
  double get buttonM => 36;

  /// 40
  double get buttonL => 40;

  /// 48
  double get buttonXL => 48;

  BorderRadiusData get brRadius => const BorderRadiusData();
  SpacingsData get spacings => const SpacingsData();
}
