import 'package:flutter/widgets.dart';

/// Everything in its box except a ring, so the white face shows through as
/// the ring around the map. The box is the ring's bounding square; the ring
/// is [ringWidth] of the 38.5 mm it measures across.
class MauritaniaRingClipper extends CustomClipper<Path> {
  const MauritaniaRingClipper({required this.ringWidth});

  final double ringWidth;

  @override
  Path getClip(Size size) {
    final Rect outer = Offset.zero & size;
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(outer)
      ..addOval(outer)
      ..addOval(outer.deflate(ringWidth));
  }

  @override
  bool shouldReclip(MauritaniaRingClipper old) => old.ringWidth != ringWidth;
}
