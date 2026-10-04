import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauritania_plate/mauritania_plate.dart';
import 'package:plate_core/plate_core.dart';

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
    ('blue', MauritaniaPlates.blue, MauritaniaThemes.blue, '1234AB00'),
    ('red', MauritaniaPlates.red, MauritaniaThemes.red, '1006TT05'),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), MauritaniaPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(
        spec,
        values.split('').toList(),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 110,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: MauritaniaCountry.mauritania,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/$name.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
