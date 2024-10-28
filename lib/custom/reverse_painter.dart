import 'package:flutter/material.dart';

class ReversePainter extends CustomPainter {
  final Animation<double> value;
  const ReversePainter({required this.value}) : super(repaint: value);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
