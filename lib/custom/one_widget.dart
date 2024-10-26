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
    final curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    tween = Tween(
      begin: 0.0,
      end: 1.0,
    );
    rtween = Tween(
      begin: 1.0,
      end: 0.0,
    );
    fadeValue = tween.animate(_controller
        // curve
        );
    if (mounted) {
      _controller.forward(from: 0.1);
    }
  }

  @override
  void didUpdateWidget(covariant FadingMarkdownComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      setState(() {
        _previousText = oldWidget.data; // Update to the new data
      });
      _controller.forward(
          from: -1); // Restart fade-in only on true content change
      
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
      children: [
        AnimatedBuilder(
            animation: fadeValue,
            builder: (context, child) {
              return Visibility(
                  visible: fadeValue.value < 1.0,
                  child: Opacity(
                      opacity: 1 - fadeValue.value,
                      child: MarkdownStyledBody(data: _previousText)));
            }),
        AnimatedBuilder(
            animation: fadeValue,
            builder: (context, child) {
              return Visibility(
                  visible: fadeValue.value > 0.0,
                  child: Opacity(
                      opacity: fadeValue.value,
                      child: MarkdownStyledBody(data: widget.data)));
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
