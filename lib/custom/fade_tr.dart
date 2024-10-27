import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A custom FadeTransition widget that provides separate forward and reverse
/// opacity values and uses a builder function.
class CustomFadeTransition extends SingleChildRenderObjectWidget {
  /// Creates an opacity transition.
  const CustomFadeTransition({
    super.key,
    required this.forwardOpacityValue,
    required this.reverseOpacityValue,
    required this.builder,
    this.alwaysIncludeSemantics = false,
  });

  /// Animation value controlling the opacity for forward animation.
  final Animation<double> forwardOpacityValue;

  /// Animation value controlling the opacity for reverse animation.
  final Animation<double> reverseOpacityValue;

  /// Builds the child widget with current opacity and child widget.
  final Widget Function(BuildContext context, double forwardOpacity,
      double reverseOpacity, Widget child) builder;

  /// Whether the semantic information of the children is always included.
  ///
  /// Defaults to false.
  ///
  /// When true, regardless of the opacity settings the child semantic
  /// information is exposed as if the widget were fully visible.
  final bool alwaysIncludeSemantics;

  @override
  RenderCustomAnimatedOpacity createRenderObject(BuildContext context) {
    return RenderCustomAnimatedOpacity(
      forwardOpacity: forwardOpacityValue,
      reverseOpacity: reverseOpacityValue,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomAnimatedOpacity renderObject) {
    renderObject
      ..forwardOpacity = forwardOpacityValue
      ..reverseOpacity = reverseOpacityValue
      ..alwaysIncludeSemantics = alwaysIncludeSemantics;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Animation<double>>(
        'forwardOpacity', forwardOpacityValue));
    properties.add(DiagnosticsProperty<Animation<double>>(
        'reverseOpacity', reverseOpacityValue));
    properties.add(FlagProperty('alwaysIncludeSemantics',
        value: alwaysIncludeSemantics, ifTrue: 'alwaysIncludeSemantics'));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: forwardOpacityValue,
      builder: (context, child) => builder(
        context,
        forwardOpacityValue.value,
        reverseOpacityValue.value,
        child!,
      ),
    );
  }
}

/// RenderObject for CustomFadeTransition.
class RenderCustomAnimatedOpacity extends RenderAnimatedOpacity {
  RenderCustomAnimatedOpacity({
    required Animation<double> forwardOpacity,
    required Animation<double> reverseOpacity,
    required super.alwaysIncludeSemantics,
  })  : _forwardOpacity = forwardOpacity,
        _reverseOpacity = reverseOpacity,
        super(
            opacity: forwardOpacity);

  Animation<double> _forwardOpacity;
  Animation<double> _reverseOpacity;

  @override
  Animation<double> get opacity => _forwardOpacity;

  set forwardOpacity(Animation<double> value) {
    if (_forwardOpacity != value) {
      _forwardOpacity = value;
      markNeedsPaint();
    }
  }

  set reverseOpacity(Animation<double> value) {
    if (_reverseOpacity != value) {
      _reverseOpacity = value;
      markNeedsPaint();
    }
  }
}
