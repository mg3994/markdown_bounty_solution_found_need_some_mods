import 'package:flutter/material.dart';

class FlowOpacity extends FlowDelegate {
  final Animation<double> repaint;
  FlowOpacity({required this.repaint}) : super(repaint: repaint);
  @override
  void paintChildren(FlowPaintingContext context) {
    // var forwardOpacity = double.parse(repaint.value.toStringAsFixed(6));
    // var reverseOpacity =
    //     double.parse(ReverseAnimation(repaint).value.toStringAsFixed(6));
    var forwardOpacity = repaint.value;
    var reverseOpacity = ReverseAnimation(repaint).value;

    context.paintChild(0,
        // transform: Matrix4.identity(),
        opacity: reverseOpacity);
    context.paintChild(1,
        // transform: Matrix4.identity(),
        opacity: forwardOpacity);
    debugPrint("forwardOpacity:" + forwardOpacity.toString());
    debugPrint("reverseOpacity:" + reverseOpacity.toString());
  }

  @override
  bool shouldRepaint(FlowOpacity oldDelegate) {
    return false;
    // return repaint.value != oldDelegate.repaint.value;
  }
}
