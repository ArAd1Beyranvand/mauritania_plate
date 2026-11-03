FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Mauritania to view examples:

https://platexample.ir/#/discover/mauritania:python

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

### Install (Python)

Copy `python/plates/countries/mauritania/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.mauritania.data import SPECS, THEMES

spec = SPECS["mr.standard"]
theme = THEMES["MauritaniaThemes.blue"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mr.standard`

## Themes

- `MauritaniaThemes.blue`
- `MauritaniaThemes.red`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `MauritaniaPlateValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mauritania_plate/blob/main/LICENSE).
