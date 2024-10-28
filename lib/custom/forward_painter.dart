import 'package:flutter/material.dart';

class ForwardPainter extends CustomPainter {
  final Animation<double> value; //opacity
  const ForwardPainter({required this.value}) : super(repaint: value);
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
