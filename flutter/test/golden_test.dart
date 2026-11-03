import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauritania_plate/mauritania_plate.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';

void main() {
  setUpAll(() async {
    final loader = FontLoader('Roboto');
    for (final path in const [
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
      '/usr/share/fonts/truetype/noto/NotoSansArabic-Bold.ttf',
    ]) {
      final file = File(path);
      if (!file.existsSync()) continue;
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  final cases = <(String, PlateSpec, PlateTheme, String)>[
    ('blue', MauritaniaPlates.standard, MauritaniaThemes.blue, '1234 AB 00'),
    ('red', MauritaniaPlates.standard, MauritaniaThemes.red, '1006 TT 05'),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), MauritaniaPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(spec, values.split(' '));
      await pumpPlateGolden(
        tester,
        controller,
        'goldens/$name.png',
        theme: theme,
        scoped: false,
        country: MauritaniaCountry.mauritania,
        stage: Size(520, 110),
      );
    });
  }
}
