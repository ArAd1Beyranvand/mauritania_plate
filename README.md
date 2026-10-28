FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Mauritania to view examples:

https://platexample.ir/#/discover/mauritania

# mauritania_plate

Mauritania's licence plates for the `plate_core` library. The Euro-style plate, `1234 AB 00` — four digits, two letters, a two-digit region — with the `RIM` strip at the right, in blue and in red. The older strip-less and stacked series, the navy plate and the temporary plate are not implemented, and neither is the 2017 Arabic-letter form.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  mauritania_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:mauritania_plate/mauritania_plate.dart';

PlateCanvas(
  spec: MauritaniaPlates.standard,
  theme: MauritaniaThemes.blue,
  validator: const MauritaniaPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `MauritaniaCountry` — country panel: `mauritania`.
- `MauritaniaPlates` — 1 plate spec: `standard`.
- `MauritaniaThemes` — 2 themes: `blue`, `red`.
- `MauritaniaPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `MauritaniaRegions` — code table.
- 1 bundled asset (`Mauritania_map.svg`).

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

