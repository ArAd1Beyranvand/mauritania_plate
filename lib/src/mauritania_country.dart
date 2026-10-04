import 'package:plate_core/plate_core.dart';

import 'mauritania_colors.dart';

/// Mauritania as a `PlateCountry`. The `RIM` strip and its ring are painted
/// by the spec's background, bands and labels, so there is no panel or flag
/// asset: the map inside the ring is a crest and is not drawn.
abstract final class MauritaniaCountry {
  static const PlateCountry mauritania = PlateCountry(
    code: 'mr',
    captionLines: <String>[],
    panelColor: MauritaniaColors.blue,
    panelTextColor: MauritaniaColors.white,
    flagAspectRatio: 1.5,
  );
}
