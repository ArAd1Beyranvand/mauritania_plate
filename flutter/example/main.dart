import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:mauritania_plate/mauritania_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: MauritaniaPlates.standard,
    theme: MauritaniaThemes.blue,
  ),
);
