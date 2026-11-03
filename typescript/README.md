FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Mauritania to view examples:

https://platexample.ir/#/discover/mauritania:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/mauritania/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/mauritania';

const spec = country.specs.get('mr.standard');
console.log(country.package);
```

## Specs

The specs are the same in every language (they come from shared data).

- `mr.standard`

## Themes

- `MauritaniaThemes.blue`
- `MauritaniaThemes.red`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`MauritaniaPlateValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mauritania_plate/blob/main/LICENSE).
