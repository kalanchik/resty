import 'package:flutter/widgets.dart';

@immutable
abstract class SegmentControlSize {
  const SegmentControlSize();

  double get height;
}

class SegmentControlSizeXS extends SegmentControlSize {
  const SegmentControlSizeXS();

  @override
  double get height => 24;
}

class SegmentControlSizeS extends SegmentControlSize {
  const SegmentControlSizeS();

  @override
  double get height => 32;
}

class SegmentControlSizeM extends SegmentControlSize {
  const SegmentControlSizeM();

  @override
  double get height => 36;
}

class SegmentControlSizeL extends SegmentControlSize {
  const SegmentControlSizeL();

  @override
  double get height => 40;
}

class SegmentControlSizeXL extends SegmentControlSize {
  const SegmentControlSizeXL();

  @override
  double get height => 44;
}
