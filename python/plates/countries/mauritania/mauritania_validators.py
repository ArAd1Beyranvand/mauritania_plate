"""Port of mauritania_plate/lib/src/mauritania_validators.dart."""
from __future__ import annotations

import re
from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation


class MauritaniaPlateValidator(GatedPlateValidator):
    gate_group = "region"

    _number = re.compile(r"^[0-9]{4}$")
    _letters = re.compile(r"^[A-Z]{2}$")

    def judge(self, entry: PlateEntry) -> PlateValidation:
        number = entry.group("number")
        letters = entry.group("letters")
        region = entry.group("region")

        if not self._number.fullmatch(number):
            return PlateValidation.invalid("The number is four digits.")
        if not self._letters.fullmatch(letters):
            return PlateValidation.invalid("The series is two letters.")
        if region is None or region not in ("00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"):
            return PlateValidation.invalid("The region is 00 to 12.")
        return PlateValidation.valid()
