import 'package:flutter/material.dart';

class FlowOpacity extends FlowDelegate {
  final Animation<double> repaint;
  FlowOpacity({required this.repaint}) : super(repaint: repaint);
  @override
  void paintChildren(FlowPaintingContext context) {
    context.paintChild(0,
        transform: Matrix4.identity(), opacity: 1.0 - repaint.value);
    context.paintChild(1,
        transform: Matrix4.identity(), opacity: repaint.value);
  }

  @override
  bool shouldRepaint(FlowOpacity oldDelegate) {
    if (repaint.value != oldDelegate.repaint.value) {
      return true;
    }
    return false;
  }
}
