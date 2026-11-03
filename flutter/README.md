FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Mauritania to view examples:

https://platexample.ir/#/discover/mauritania:flutter

# mauritania_plate

Mauritania's licence plates for the plate_core library — the Euro-style blue-on-white plate and its red variant, with the regional codes and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/mauritania_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/mauritania:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/mauritania_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/mauritania:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/mauritania_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/mauritania:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/mauritania_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/mauritania:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  mauritania_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `MauritaniaPlates.standard`

## Themes

- `MauritaniaThemes.blue`
- `MauritaniaThemes.red`

## Change it

`PlateCanvas` takes `spec:` (an entry of `MauritaniaPlates`) and `theme:` (an entry of `MauritaniaThemes`). Set `validator:` to `MauritaniaPlateValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `MauritaniaCountry` — the country panel.
- `MauritaniaPlateValidator` — the plate validator.
- `MauritaniaRegions` — code table.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mauritania_plate/blob/main/LICENSE).
