/// Mauritania's licence plates for the `plate_core` library.
///
/// The Euro-style plate, `1234 AB 00` — four digits, two letters, a two-digit
/// region — with the `RIM` strip at the right, in blue and in red. The older
/// strip-less and stacked series, the navy plate and the temporary plate are
/// not implemented, and neither is the 2017 Arabic-letter form.
library;

// TODO(py): [D5] one module `plates.countries.mauritania`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/mauritania`; tree-shakable.
// TODO(kt): [D5] package `countries.mauritania` in the countries module.
export 'src/mauritania_alphabets.dart';
export 'src/mauritania_colors.dart';
export 'src/mauritania_country.dart';
export 'src/mauritania_plates.dart';
export 'src/mauritania_regions.dart';
export 'src/mauritania_themes.dart';
export 'src/mauritania_validators.dart';
