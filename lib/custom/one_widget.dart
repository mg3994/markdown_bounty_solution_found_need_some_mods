import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'blen_mask.dart';
import 'flow_del.dart';

class FadingMarkdownComponent extends StatefulWidget {
  final String data;

  const FadingMarkdownComponent({super.key, required this.data});

  @override
  State<FadingMarkdownComponent> createState() =>
      _FadingMarkdownComponentState();
}

class _FadingMarkdownComponentState extends State<FadingMarkdownComponent>
    with TickerProviderStateMixin {
  String _previousText = '';
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2000));
  late final Animation<double> fadeAnimation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    _controller.reset();
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant FadingMarkdownComponent oldWidget) {
    //do not touch this
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      setState(() {
        _previousText = oldWidget.data; // Update to the new data
        _controller.forward(from: 0.0);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// say no to any Animation Builder or that stuff , only can use is AnimationController , Curve you can choose is easeIn or linear , try custom pain for container and pass that animation<double> value to repaint: (animation.value) and hide on based of that
//it will fix that junk problem //IDEA designed
//implimentation left
//Limitation in old idea was Animation Builder is not working properly due to the property it creates its own CustomClip Painter
  @override
  Widget build(BuildContext context) {
    //Flow will handle RepaintBoundary.wrapAll
    return Flow(
      delegate: FlowOpacity(repaint: fadeAnimation),
      clipBehavior: Clip.none,
      children: [
        IgnorePointer(
          child: MarkdownStyledBody(data: _previousText),
        ),
        MarkdownStyledBody(data: widget.data),
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
