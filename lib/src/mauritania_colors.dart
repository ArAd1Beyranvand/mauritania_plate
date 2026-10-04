import 'package:flutter/widgets.dart';

/// The colours of Mauritania's plates.
///
/// [blue] is the modal colour of the strip, the serial and the frame in the
/// vector artwork `Plaques_d'immatriculation_de_la_Mauritanie.png`. [red] is
/// the median of the red pixels of the strip and serial in the photograph
/// `Mauretan_KfZ-Kennzeichen_rot_…jpg`, which is lit and dim — the true print
/// is probably brighter. The article does not say what the red series is for.
abstract final class MauritaniaColors {
  static const Color blue = Color(0xFF003399);
  static const Color red = Color(0xFF7C2736);
  static const Color white = Color(0xFFFFFFFF);
  static const Color inactive = Color(0xFFB0B0B0);
}
