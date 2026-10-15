import 'package:flutter_test/flutter_test.dart';
import 'package:mauritania_plate/mauritania_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  test('a two-digit code names the region', () {
    expect(MauritaniaRegions.nameOf('00'), 'Nouakchott');
    expect(MauritaniaRegions.nameOf('08'), 'Dakhlet Nouadhibou');
    expect(MauritaniaRegions.nameOf('12'), 'Inchiri');
  });

  test('a lone digit and unissued codes name nothing', () {
    for (final String code in <String>['', '0', '1', '13', '99']) {
      expect(MauritaniaRegions.nameOf(code), isNull, reason: code);
    }
  });

  test('every plate follows each digit typed and deleted', () {
    for (final PlateSpec spec in MauritaniaPlates.all) {
      final PlateController c = PlateController(spec: spec);
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', '0');
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', '06');
      expect(c.regionCaption, 'Trarza', reason: spec.id);
      c.setGroup('region', '0');
      expect(c.regionCaption, isNull, reason: spec.id);
    }
  });
}
