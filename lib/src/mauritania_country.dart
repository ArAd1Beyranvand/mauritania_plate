import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'mauritania_colors.dart';

/// Mauritania as a `PlateCountry`. The `RIM` strip and its ring are painted
/// by the spec's background, bands and labels; the flag is the country's map,
/// white, shown inside the ring. `assets/Mauritania_map.svg` is the path of
/// Commons' `Mauritania blank map.svg` (public domain, Radosław Botev),
/// refilled white.
abstract final class MauritaniaCountry {
  static const PlateCountry mauritania = PlateCountry(
    code: 'mr',
    captionLines: <String>[],
    panelColor: Color(0x00000000),
    panelTextColor: MauritaniaColors.white,
    flagAspectRatio: 327 / 361,
    flag: SvgPlateAsset(
      'assets/Mauritania_map.svg',
      package: 'mauritania_plate',
    ),
  );
}
