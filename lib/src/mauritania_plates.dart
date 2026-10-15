import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'mauritania_alphabets.dart';
import 'mauritania_clippers.dart';
import 'mauritania_colors.dart';
import 'mauritania_country.dart';
import 'mauritania_regions.dart';

/// Where the ink sits on a Mauritanian plate, in millimetres.
///
/// Measured off `Plaques_d'immatriculation_de_la_Mauritanie.png` (1000×222)
/// by normalising it to the article's 520×110. The artwork is drawn at 4.5
/// against the documented 4.73, so x positions carry ~5%.
///
/// * Strip: x 465.4 to the edge, a background column, not a box.
/// * Ring: white, x 468.5..507.0, y 15.9..54.0 (38.5 across, centre
///   487.7, 35.0), ~2.5 mm thick, cut out of the strip by
///   `MauritaniaRingClipper`, so the white face is the ring. The map inside it is a crest and is not drawn.
/// * Arabic `ج إ م`: white ink x 475.3..501.3, y 59.0..69.4.
/// * `RIM`: white ink x 475.3..502.3, y 73.3..85.2.
/// * Serial: ink x 31.7..441.0, y 21.3..86.2 (65 tall, centre 53.8). Glyph
///   centres: digits 78.8, 124.3, 169.3 (pitch ~45.5, so the `1` is centred
///   on 33.3); letters 248.9 and 301.0; region 378.6 and 424.4.
///
/// **Under-height serial, accepted.** Ink 65 mm tall would need a ~118 mm
/// box on a 110 mm plate. A slot scales its glyph to fit its cell and DejaVu
/// Bold is wider than the plate's condensed face, so the serial is
/// width-limited: golden ink y 31..74 (43 tall, 66% of the reference),
/// centred 1.3 mm high. Columns agree within 2 mm (`2` 63..93 against
/// 61.9..95.7; last `0` 407..441 against 407.7..441.0), except the `1`, which
/// has a base in DejaVu and none on the plate. Measured in the golden: ring
/// 16..53, strip from 466, Arabic y 59..70, `RIM` y 75..83 (reference 73..85).
/// `plate_core` is unchanged.
///
/// **Not drawn.** The 2017 Arabic-letter form.
abstract final class _Layout {
  static const double width = 520;
  static const double height = 110;

  static const double stripStart = 465.4;

  static const double ringOuter = 38.5;
  static const double ringWidth = 2.5;
  static const double ringLeft = 468.45;
  static const double ringTop = 15.75;

  /// White map ink x 475.3..498.2, y 22.3..47.1 in the artwork.
  static const PlateBox map = PlateBox(475.3, 22.3, 22.9, 24.8);

  static const PlateBox arabic = PlateBox(468, 54.5, 40, 19);
  static const double arabicGlyph = 17;
  static const PlateBox rim = PlateBox(468, 72, 40, 15);
  static const double rimGlyph = 19;

  static const double serialCentreY = 53.8;
  static const double serialHeight = 82;
  static const double serialTop = serialCentreY - serialHeight / 2;

  static const double digitPitch = 45.5;
  static const double letterPitch = 52;

  /// First cell centre, pitch, cell count and whether it is a digit, left to
  /// right: `NNNN LL RR`.
  static const List<(double, double, int, bool)> fields =
      <(double, double, int, bool)>[
        (33.3, digitPitch, 4, true),
        (248.9, letterPitch, 2, false),
        (378.6, digitPitch, 2, true),
      ];
}

abstract final class MauritaniaPlates {
  /// The Euro-style plate in blue. Slots: four digits, two letters, two
  /// region digits, one slot each. Pair with `MauritaniaThemes.blue`.
  static final PlateSpec blue = _plate('mr.blue', MauritaniaColors.blue);

  /// The same plate in red. Pair with `MauritaniaThemes.red`.
  static final PlateSpec red = _plate('mr.red', MauritaniaColors.red);

  static final List<PlateSpec> all = <PlateSpec>[blue, red];

  /// The strip, with the ring cut out of it: the white face shows through
  /// as the ring. A filled disc on top would cover the map, which the panel
  /// paints under the bands.
  static PlateSection _strip(Color strip) {
    final PlateSection fill = PlateSection.fill(PlateFill.color(strip));
    return PlateSection.rows(<PlatePart>[
      PlatePart(fill, end: _Layout.ringTop),
      PlatePart(
        PlateSection.columns(<PlatePart>[
          PlatePart(fill, end: _Layout.ringLeft),
          PlatePart(
            PlateSection.fill(
              PlateFill.color(strip),
              shape: const MauritaniaRingClipper(ringWidth: _Layout.ringWidth),
            ),
            end: _Layout.ringLeft + _Layout.ringOuter,
          ),
          PlatePart(fill),
        ]),
        end: _Layout.ringTop + _Layout.ringOuter,
      ),
      PlatePart(fill),
    ]);
  }

  static PlateSpec _plate(String id, Color strip) => PlateSpec(
    id: id,
    country: MauritaniaCountry.mauritania,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: const PlatePanel(box: _Layout.map, padding: EdgeInsets.zero),
    background: PlateSection.columns(<PlatePart>[
      const PlatePart(PlateSection.plain, end: _Layout.stripStart),
      PlatePart(_strip(strip)),
    ]),
    labels: const <PlateLabel>[
      PlateLabel(
        text: 'ج إ م',
        box: _Layout.arabic,
        glyphHeight: _Layout.arabicGlyph,
        color: MauritaniaColors.white,
      ),
      PlateLabel(
        text: 'RIM',
        box: _Layout.rim,
        glyphHeight: _Layout.rimGlyph,
        color: MauritaniaColors.white,
      ),
    ],
    slots: <PlateSlot>[
      for (final (double centre, double pitch, int count, bool digit)
          in _Layout.fields)
        PlateSlot(
          alphabet: digit
              ? MauritaniaAlphabets.digits
              : MauritaniaAlphabets.letters,
          box: PlateBox(
            centre - pitch / 2,
            _Layout.serialTop,
            count * pitch,
            _Layout.serialHeight,
          ),
          length: count,
          spacing: max(0, pitch - 0.6 * 0.72 * _Layout.serialHeight),
        ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'number'),
      PlateTextGroup(<int>[1], key: 'letters'),
      PlateTextGroup(<int>[2], key: 'region'),
    ],
    resolveRegion: MauritaniaRegions.captionOf,
  );
}
