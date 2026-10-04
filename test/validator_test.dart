import 'package:flutter_test/flutter_test.dart';
import 'package:mauritania_plate/mauritania_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(String v) => const MauritaniaPlateValidator().validate(
    PlateEntry(spec: MauritaniaPlates.blue, values: v.split('')),
  );

  test('a full plate is valid', () {
    expect(judge('1234AB00').isValid, isTrue);
  });

  test('region 13 is reported', () {
    expect(judge('1234AB13').isValid, isFalse);
  });
}
