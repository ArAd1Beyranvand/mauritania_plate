import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'mauritania_colors.dart';

/// One ink on a white field, framed in the same ink. Off the artwork
/// normalised to 520×110: the frame is 3.6 mm (0.033 of the height) and the
/// outer corner turns over ~9.5 mm (0.085).
abstract final class MauritaniaThemes {
  static PlateTheme _livery(Color ink) => PlateTheme(
    plateBackground: MauritaniaColors.white,
    plateBorder: ink,
    ink: ink,
    dividerColor: ink,
    borderWidthRatio: 0.033,
    plateRadiusRatio: 0.085,
    activeColor: ink,
    inactiveColor: MauritaniaColors.inactive,
  );

  /// Blue on white: pair with `MauritaniaPlates.blue`.
  static final PlateTheme blue = _livery(MauritaniaColors.blue);

  /// Red on white: pair with `MauritaniaPlates.red`.
  static final PlateTheme red = _livery(MauritaniaColors.red);
}
