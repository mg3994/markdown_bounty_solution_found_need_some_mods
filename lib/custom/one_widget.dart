import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'blen_mask.dart';


class FadingMarkdownComponent extends StatefulWidget {
  final String data;

  const FadingMarkdownComponent({super.key, required this.data});

  @override
  State<FadingMarkdownComponent> createState() =>
      _FadingMarkdownComponentState();
}

class _FadingMarkdownComponentState extends State<FadingMarkdownComponent>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> tween;
  late Tween<double> rtween;
  late Animation<double> _forwardAnimation;
  late ReverseAnimation _reverseAnimation;

  String _previousText = '';
  Duration duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        upperBound: 0.9999,
        lowerBound: 0.0001,
        vsync: this,
        duration: duration,
        reverseDuration: Duration.zero);
    _reverseAnimation = ReverseAnimation(_controller);
    _forwardAnimation = _controller;
    if (mounted) {
      _controller.reset();
      _controller.forward(from: 0.0001);
      _controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void didUpdateWidget(covariant FadingMarkdownComponent oldWidget) {
    //do not touch this
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      setState(() {
        _controller.forward(
            from: 0.0001); // Restart fade-in only on true content change
        _previousText = oldWidget.data; // Update to the new data
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var forwardAnimation =
        double.parse(_forwardAnimation.value.toStringAsFixed(4));
    var reverseAnimation =
        double.parse(_reverseAnimation.value.toStringAsFixed(4));
    debugPrint("forwardAnimation: $forwardAnimation");
    debugPrint("reverseAnimation: $reverseAnimation");
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BlendMask(
          blendMode: BlendMode.xor,
          child: IgnorePointer(
            child: Opacity(
              // opacity: reverseAnimation,
              opacity: 1,
              child: MarkdownStyledBody(data: _previousText),
            ),
          ),
        ),
        BlendMask(
          blendMode: BlendMode.xor,
          child: Opacity(
            // opacity: forwardAnimation,
            opacity: 1,
            child: MarkdownStyledBody(data: widget.data),
          ),
        ),
      ],
    );
  }
}

/// design to `DRY`
class MarkdownStyledBody extends MarkdownBody {
  const MarkdownStyledBody({
    super.key,
    required super.data,
    super.selectable = true,
    super.styleSheet,
    super.styleSheetTheme,
    super.syntaxHighlighter,
    super.onSelectionChanged,
    super.onTapLink,
    super.onTapText,
    super.imageDirectory,
    super.blockSyntaxes,
    super.inlineSyntaxes,
    super.extensionSet,
    super.imageBuilder,
    super.checkboxBuilder,
    super.bulletBuilder,
    super.builders,
    super.paddingBuilders,
    super.listItemCrossAxisAlignment,
    super.shrinkWrap = true,
    super.fitContent = true,
    super.softLineBreak,
  });
}
