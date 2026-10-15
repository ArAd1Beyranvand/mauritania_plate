import 'package:plate_core/plate_core.dart';

/// The two-digit region code that ends a plate, from the article's list.
abstract final class MauritaniaRegions {
  static const Map<String, String> byCode = <String, String>{
    '00': 'Nouakchott',
    '01': 'Hodh Ech Chargui',
    '02': 'Hodh El Gharbi',
    '03': 'Assaba',
    '04': 'Gorgol',
    '05': 'Brakna',
    '06': 'Trarza',
    '07': 'Adrar',
    '08': 'Dakhlet Nouadhibou',
    '09': 'Tagant',
    '10': 'Guidimaka',
    '11': 'Tiris Zemmour',
    '12': 'Inchiri',
  };

  static String? nameOf(String code) => byCode[code];

  /// A [PlateLabelResolver] for [PlateSpec.resolveRegion]: null until both
  /// digits are typed.
  static String? captionOf(String Function(String key) group) =>
      nameOf(group('region'));
}
