import 'package:flutter/material.dart';

extension AnimatedFadeTextSpan on InlineSpan {
  TextSpan fadeInTextSpan({
    required Animation<double> controller,
    required String text,
    TextStyle? style,
  }) {
  


    return TextSpan(
      text: text,
      style: style?.copyWith(
        color: style.color
            ?.withOpacity(controller.value), // Apply the animated opacity
      ),
    );
  }
}
