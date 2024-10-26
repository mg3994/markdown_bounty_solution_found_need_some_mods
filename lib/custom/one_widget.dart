import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String data;

  const AnimatedTextWidget({super.key, required this.data});

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
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
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _controller.reset();
      _controller.forward();
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
                child: MarkdownBody(data: _previousText),
              ),
              Opacity(
                opacity: value,
                child: MarkdownBody(data: widget.data),
              ),
            ],
          );
        });
  }
}
