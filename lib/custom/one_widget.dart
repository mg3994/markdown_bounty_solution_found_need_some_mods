import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
  late Animation<double> fadeValue;

  String _previousText = '';
  Duration duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );

    tween = Tween(
      begin: 0.0,
      end: 1.0,
    );
    rtween = Tween(
      begin: 1.0,
      end: 0.0,
    );
    fadeValue = tween.animate(_controller);
    if (mounted) {
      _controller.reset();
      _controller.forward(from: 0.0);
    }
  }

  @override
  void didUpdateWidget(covariant FadingMarkdownComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      setState(() {
        _controller.forward(
            from: 0.0); // Restart fade-in only on true content change
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedBuilder(
            animation: fadeValue,
            builder: (context, child) {
              return Opacity(
                  opacity: 1 - fadeValue.value,
                  child: MarkdownStyledBody(data: _previousText));
            }),
        AnimatedBuilder(
            animation: fadeValue,
            builder: (context, child) {
              return Opacity(
                  opacity: fadeValue.value,
                  child: MarkdownStyledBody(data: widget.data));
            }),
      ],
    );
  }
}

/// design to `DRY`
class MarkdownStyledBody extends MarkdownBody {
  const MarkdownStyledBody({
    super.key,
    required super.data,
    super.selectable,
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
