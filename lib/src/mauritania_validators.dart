import 'package:plate_core/plate_core.dart';

import 'mauritania_regions.dart';

/// Judges a `MauritaniaPlates` value, `NNNN LL RR`. Reports, never bars a
/// keystroke.
class MauritaniaPlateValidator extends GatedPlateValidator {
  const MauritaniaPlateValidator();

  @override
  String get gateGroup => 'region';

  static const String reasonNumber = 'The number is four digits.';
  static const String reasonLetters = 'The series is two letters.';
  static const String reasonRegion = 'The region is 00 to 12.';

  static final RegExp _number = RegExp(r'^[0-9]{4}$');
  static final RegExp _letters = RegExp(r'^[A-Z]{2}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_number.hasMatch(entry.group('number'))) {
      return const PlateValidation.invalid(reasonNumber);
    }
    if (!_letters.hasMatch(entry.group('letters'))) {
      return const PlateValidation.invalid(reasonLetters);
    }
    if (MauritaniaRegions.nameOf(entry.group('region')) == null) {
      return const PlateValidation.invalid(reasonRegion);
    }
    return const PlateValidation.valid();
  }
}
