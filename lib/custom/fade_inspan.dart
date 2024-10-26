import 'package:flutter/material.dart';

extension AnimatedFadeTextSpan on InlineSpan {
  TextSpan fadeInTextSpan({
    // required AnimationController controller,
    required String text,
    TextStyle? style,
  }) {
    // Define an animation that animates opacity from 0 to 1
    // final opacityAnimation =
    //     Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    return TextSpan(
      text: text,
      style: style?.copyWith(
        color: style.color?.withOpacity(0.5
            // opacityAnimation.value
            ), // Apply the animated opacity
      ),
    );
  }
}
