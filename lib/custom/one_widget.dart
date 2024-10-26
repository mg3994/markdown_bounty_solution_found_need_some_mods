import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FadingMarkdownComponent extends StatefulWidget {
  final String data;

  const FadingMarkdownComponent({super.key, required this.data});

  @override
  State<FadingMarkdownComponent> createState() =>
      _FadingMarkdownComponentState();
}

class _FadingMarkdownComponentState extends State<FadingMarkdownComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _previousText = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant FadingMarkdownComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      // _controller.reset();
      _controller.forward(from: 0.0);
      _previousText = widget.data;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: _animation,
        builder: (context, value, child) {
          return Stack(
            children: [
              Opacity(
                opacity: 1 - value,
                child: MarkdownStyledBody(data: _previousText),
              ),
              Opacity(
                opacity: value,
                child: MarkdownStyledBody(data: widget.data),
              ),
            ],
          );
        });
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
